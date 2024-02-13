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
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

package.path = package.path .. ";./?.lh"

function EnvRequire(path, db)
    setmetatable(db, {__index=_G})
    setfenv(0, db)
    require(path)
    setfenv(0, getmetatable(db).__index)
    setmetatable(db, nil)
end

envTemplate = {
    require = function(file) EnvRequire(file, envTemplate); end,
    Include = Include,
    print = print,
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
}

local initScriptLoader = loadfile(initScriptPath)
setfenv(initScriptLoader, envTemplate)
initScriptLoader()
initScriptLoader = nil