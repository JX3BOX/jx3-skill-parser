import { LuaReturn, LuaThread, LuaType } from 'wasmoon-lua5.1';

// 编码问题 原来的方案行不通
// 得重新写一个newindex，保证AddAttribute不经过js
// 不然如果lua端传入gbk，wasm会尝试用utf8解析，然后就不可逆的乱码了。

export const registerIndexFunction = (thread: LuaThread): number => {
    const pointer = thread.luaApi.module.addFunction((L: number) => {
        const callThread = thread.stateToThread(L);
        const key = callThread.getValue(2);
        // 拿到target的元表
        callThread.luaApi.lua_getmetatable(L, 1);
        // 尝试访问元表的__inner字段
        callThread.luaApi.lua_getfield(L, -1, '__inner');
        if (callThread.luaApi.lua_type(L, -1) === LuaType.Table) {
            // 如果__inner存在，尝试获取__inner[key]，否则继续正常流程
            callThread.luaApi.lua_getfield(L, -1, key as string);
            // 如果__inner[key]存在，此时栈顶是目标值，直接返回
            if (callThread.luaApi.lua_type(L, -1) !== LuaType.Nil) {
                return 1;
            }
            // 否则弹出__inner[key] as nil，继续正常流程
            callThread.pop();
        }
        // 弹出target的元表和__inner
        callThread.pop(2);
        const userdata = callThread.luaApi.lua_touserdata(L, 1);
        const ref = callThread.luaApi.module.getValue(userdata, '*');
        const target = callThread.luaApi.getRef(ref as number);
        const value = typeof target[key] === 'function' ? target[key].bind(target) : target[key];

        callThread.pushValue(value);
        return 1;
    }, 'ii');

    return pointer;
};

export const registerNewIndexFunction = (thread: LuaThread): number => {
    const pointer = thread.luaApi.module.addFunction((L: number) => {
        const callThread = thread.stateToThread(L);
        // 给js端的对象赋值
        const userdata = callThread.luaApi.lua_touserdata(L, 1);
        const ref = callThread.luaApi.module.getValue(userdata, '*');
        const key = callThread.getValue(2);
        if (callThread.luaApi.lua_type(L, 3) !== LuaType.Function) {
            const value = callThread.getValue(3);
            thread.luaApi.getRef(ref as number)[key] = value;
        }
        // 给lua端的table的元表__inner赋值
        callThread.luaApi.lua_getmetatable(L, 1);
        // 首先尝试访问元表的__inner字段
        callThread.luaApi.lua_getfield(L, -1, '__inner');
        if (callThread.luaApi.lua_type(L, -1) === LuaType.Nil) {
            // 如果不存在，先在元表上创建__inner字段
            // 栈顶是nil，弹出
            callThread.luaApi.lua_pop(L, 1);
            // 创建一个新的table
            callThread.luaApi.lua_createtable(L, 0, 0);
            // 设置元表的__inner字段
            callThread.luaApi.lua_setfield(L, -2, '__inner');
            // 此时栈顶是元表，再拿一次__inner
            callThread.luaApi.lua_getfield(L, -1, '__inner');
        }
        // 此时栈顶是__inner
        // 从栈底拿到key和value
        callThread.luaApi.lua_pushvalue(L, 2);
        callThread.luaApi.lua_pushvalue(L, 3);
        // __inner[key] = value
        callThread.luaApi.lua_settable(L, -3);
        // 弹出__inner和元表
        callThread.pop(2);
        return LuaReturn.Ok;
    }, 'ii');
    return pointer;
};
