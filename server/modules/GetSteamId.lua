ZUN.GetSteamId = function(source)
    local identifiers = GetPlayerIdentifiers(source)
    local steamIdentifier

    for _, identifier in ipairs(identifiers) do
        if string.find(identifier, 'steam:') then
            steamIdentifier = identifier
            break
        end
    end

    return steamIdentifier
end

