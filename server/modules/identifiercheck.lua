AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local playerId = source
    local identifiers = GetPlayerIdentifiers(playerId)
    local steamIdentifier

    deferrals.defer()

    for _, identifier in ipairs(identifiers) do
        if string.find(identifier, 'steam:') then
            steamIdentifier = identifier
            break
        end
    end
    
    deferrals.update("[ZC] Checking your Steam Identifier...")
    Citizen.Wait(1000)

    if steamIdentifier then
        
        deferrals.update("[ZC] Steam Identifier has been found: " .. playerName .. ' | '.. steamIdentifier)
        Citizen.Wait(1000)

        deferrals.done()
    else
        Citizen.Wait(1000)
        deferrals.done("[ZC] Steam Identifier wasn't found. Make sure Steam is running.")
    end
end)
