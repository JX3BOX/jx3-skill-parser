package.path = package.path .. ";./?.lh;./?.li"
require('base64')

function TableCopy(src, dst)
    for k, v in pairs(src) do
        dst[k] = v
    end
end

function DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
        end
        setmetatable(copy, DeepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

function EnvRequire(path, db)
    setmetatable(db, {
        __index = _G
    })
    setfenv(0, db)
    package.loaded[path] = nil
    require(path)
    local db_meta = getmetatable(db)
    if db_meta ~= nil then
        setfenv(0, getmetatable(db).__index)
    end
    setmetatable(db, nil)
end

IncludeCached = {}
envTemplate = {
    require = function(file)
        EnvRequire(file, envTemplate);
    end,
    print = function()
    end,
    math = math,
    string = string,
    table = table,
    pairs = pairs,
    ipairs = ipairs,
    pcall = pcall,
    xpcall = xpcall,
    select = select,
    tostring = tostring,
    tonumber = tonumber,
    type = type,
    unpack = unpack,
    base64 = base64,
    setfenv = setfenv,
    setmetatable = setmetatable,
    getmetatable = getmetatable,
    loadfile = loadfile
}
envTemplate.require('mock')
envTemplate.Include = function(filename)
    print(111)
    local file_base64 = base64.to_base64(filename)
    local js_result = __Include(file_base64)
    local wasm_fs_name = js_result[0]
    if not wasm_fs_name then
        return
    end
    package.loaded[wasm_fs_name] = nil
    EnvRequire(wasm_fs_name, envTemplate)
end

function resetEnv()
    env = DeepCopy(envTemplate)
    env.require = function(file)
        EnvRequire(file, env);
    end
    env.Include = function(filename)
        if IncludeCached[filename] then
            return
        end
        local file_base64 = base64.to_base64(filename)
        local js_result = __Include(file_base64)
        local wasm_fs_name = js_result[0]
        if not wasm_fs_name then
            return
        end
        EnvRequire(wasm_fs_name, env)
        if js_result[1] then
            package.loaded[wasm_fs_name] = nil
            EnvRequire(wasm_fs_name, envTemplate)
            IncludeCached[filename] = true
        end
        package.loaded[wasm_fs_name] = nil
    end
end

function loadScript(filename)
    resetEnv()
    local scriptLoader = loadfile(filename)
    setfenv(scriptLoader, env)
    scriptLoader()
end
