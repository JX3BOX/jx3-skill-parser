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

function resetEnv()
    env = DeepCopy(envTemplate)
    env.require = function(file)
        EnvRequire(file, env);
    end
    env.Include = function(filename)
        local file_base64 = base64.to_base64(filename)
        local wasm_fs_name = __Include(file_base64)
        if not wasm_fs_name then
            return
        end

        EnvRequire(wasm_fs_name, env)
    end
end

function loadScript(filename)
    resetEnv()
    local scriptLoader = loadfile(filename)
    setfenv(scriptLoader, env)
    scriptLoader()
end
