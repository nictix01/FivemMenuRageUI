local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Événement pour récupérer les informations du joueur
RegisterServerEvent('my_rp_menu:getPlayerInfo')
AddEventHandler('my_rp_menu:getPlayerInfo', function(playerId, callback)
    MySQL.Async.fetchAll('SELECT firstname, lastname, cash, bank FROM users WHERE identifier = @identifier', {
        ['@identifier'] = playerId
    }, function(result)
        if result[1] then
            callback({
                firstname = result[1].firstname,
                lastname = result[1].lastname,
                cash = result[1].cash,
                bank = result[1].bank
            })
        else
            callback(nil)
        end
    end)
end)
