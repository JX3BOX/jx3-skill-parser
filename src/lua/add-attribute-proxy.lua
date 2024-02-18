env.tSkill.AddAttribute = function(a1, a2, a3, a4)
    if type(a3) == "string" then a3 = base64.to_base64(a3); end
    if type(a4) == "string" then a3 = base64.to_base64(a4); end
    env.tSkill._AddAttribute(a1, a2, a3, a4)
end