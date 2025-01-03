local RageUI = require("RageUI")
local ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local playerData = {
    id = GetPlayerServerId(PlayerId()),
    firstname = "",
    lastname = "",
    cash = 0,
    bank = 0
}

function getPlayersInfo(playerId, callback)
    TriggerServerEvent('my_rp_menu:getPlayerInfo', playerid, function(data)
    callback(data)
    end)
end

-- Fonction pour ouvrir le menu RageUI
local function openMenu()
    RageUI.Visible(RMenu:Get('menu', 'main'), true)

    Citizen.CreateThread(function()
        while RageUI.IsVisible(RMenu:Get('menu', 'main')) do
            RageUI.DrawContent({header = true, glare = false}, function()
                RageUI.Title = { Title = "Frensh Paris RP", Color = {255, 0, 0, 255} }
                RageUI.Separator("————————")
                RageUI.Button("👤 Joueur : " .. playerData.id, nil, {RightLabel = ""}, true, {})
                RageUI.Separator("————————")
                RageUI.Button("🪪 Nom : " .. playerData.lastname, nil, {RightLabel = ""}, true, {})
                RageUI.Button("🪪 Prénom : " .. playerData.firstname, nil, {RightLabel = ""}, true, {})
                RageUI.Button("💵 Argent liquide : $" .. playerData.cash, nil, {RightLabel = ""}, true, {})
                RageUI.Button("🏧 Argent bank : $" .. playerData.bank, nil, {RightLabel = ""}, true, {})
                RageUI.Button("Voir stats avancées", nil, {RightLabel = ""}, true, {})
            end)
            Citizen.Wait(0)
        end
    end)
end

-- Commande pour ouvrir le menu avec i
RegisterCommand('openMenu', function()
    getPlayerInfo(playerData.id, function(data)
        if data then
            playerData.firstname = data.firstname
            playerData.lastname = data.lastname
            playerData.cash = data.cash
            playerData.bank = data.bank 
        else
            print('Aucune Donnée trouver.')
        end
        end)
    end, false)

    RegisterKayMapping('openMenu', 'Ouvrir le menu joueur', 'keyboard', 'I')