function getUser(source)
    local steamIdentifier = ZUN.GetSteamId(source)
    MySQL.query('SELECT * FROM users WHERE identifier = ?', { steamIdentifier }, function(result)
        if #result == 0 then
            print('Du har ingen bruger i databasen.')
        else
            local playerdata = result[1]

            print('Din karakter blev fundet.')
            print(playerdata.steam, playerdata.age)
            local coords = json.decode(result[1].position)
            print(coords.x)
            SetEntityCoords(GetPlayerPed(source), coords.x, coords.y, coords.z, true, false, false, false)
        end
    end)
end

RegisterCommand('getUsers', function(source) 
    getUser(source)
end, false)

RegisterCommand('savePos', function(source)
    local steamIdentifier = ZUN.GetSteamId(source)
    local playerCoords = GetEntityCoords(GetPlayerPed(source))
    local coords = {
        x = playerCoords.x,
        y = playerCoords.y,
        z = playerCoords.z
    }

    MySQL.query('UPDATE users SET position = ? WHERE identifier = ?', { json.encode(coords), steamIdentifier })
end, false)

-- No idea of this code works. I'm on a school computer, and cannot test it.
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    getUser(source)
end)