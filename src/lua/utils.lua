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