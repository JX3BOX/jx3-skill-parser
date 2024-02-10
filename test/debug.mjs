import { Lua } from 'wasmoon-lua5.1';

const lua = await Lua.create();
lua.doString('print("Hello, World!")');
