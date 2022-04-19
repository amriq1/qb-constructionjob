
local QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)


-- Events
RegisterNetEvent('qb-constructionjob:server:Payment', function(payment)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney(Config.PaymentMethod, Config.Payment, "Construction-salary")
end)

RegisterNetEvent('qb-constructionjob:server:pedJob', function(job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.SetJob(Config.Job, 0)
    TriggerClientEvent('QBCore:Notify', src, 'Go up to the tower to start working Engineer!')
end)