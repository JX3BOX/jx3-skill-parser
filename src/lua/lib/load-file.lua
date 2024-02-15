local scriptLoader = loadfile(scriptPath)
--env = nil
env = DeepCopy(envTemplate)
setfenv(scriptLoader, env)

scriptLoader()
--scriptLoader = nil