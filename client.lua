local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local playerJob = nil
local constructionBlip = nil
local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title=Config.Blip, colour=Config.BlipColor, id=Config.BlipSprite, x = 139.04, y = -380.12, z = 43.26}
}

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

-- Functions

local pedsSpawned = false
local function spawnPeds()
    if not Config.Peds or not next(Config.Peds) or pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        current.model = type(current.model) == 'string' and GetHashKey(current.model) or current.model
        RequestModel(current.model)
        while not HasModelLoaded(current.model) do
            Wait(0)
        end
        local ped = CreatePed(0, current.model, current.coords, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        current.pedHandle = ped

            exports['qb-target']:AddTargetEntity(ped, {
                options = {
                    {
                        type = "server",
                        event = "qb-constructionjob:server:pedJob",
                        icon = "fa-solid fa-briefcase",
                        label = "Get the job.",
                    }
                },
                distance = 2.0
            })
        end
end

-- Tower 1
local function targetZones()
  exports['qb-target']:AddBoxZone("Tower1", vector3(105.79, -357.21, 55.4), 1.1, 1.5, { 
    name = "Tower1",
    heading = 339,
    debugPoly = false,
    minZ=53.05,
    maxZ=57.05,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 2
  exports['qb-target']:AddBoxZone("Tower2", vector3(102.31, -367.23, 55.5), 1.1, 1.5, { 
    name = "Tower2",
    heading = 209,
    debugPoly = false,
    minZ=53.1,
    maxZ=57.1,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 3
  exports['qb-target']:AddBoxZone("Tower3", vector3(72.48, -338.59, 55.51), 0.5, 1.5, { 
    name = "Tower3",
    heading = 160,
    debugPoly = false,
    minZ=52.91,
    maxZ=56.91,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 4
  exports['qb-target']:AddBoxZone("Tower4", vector3(50.68, -346.79, 55.51), 2.1, 1.5, { 
    name = "Tower4",
    heading = 70,
    debugPoly = false,
    minZ=53.91,
    maxZ=57.91,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 5
  exports['qb-target']:AddBoxZone("Tower5", vector3(91.89, -362.92, 67.31), 2.7, 1.5, { 
    name = "Tower5",
    heading = 340,
    debugPoly = false,
    minZ=65.51,
    maxZ=69.51,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 6
  exports['qb-target']:AddBoxZone("Tower6", vector3(109.32, -380.02, 67.31), 2.3, 1.5, { 
    name = "Tower6",
    heading = 75,
    debugPoly = false,
    minZ=66.31,
    maxZ=69.11,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 7
  exports['qb-target']:AddBoxZone("Tower7", vector3(123.19, -342.02, 68.42), 2.5, 1.5, { 
    name = "Tower7",
    heading = 75,
    debugPoly = false,
    minZ=66.62,
    maxZ=74.02,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
  -- Tower 8
  exports['qb-target']:AddBoxZone("Tower8", vector3(102.02, -334.08, 68.42), 2.5, 1.5, { 
    name = "Tower8",
    heading = 70,
    debugPoly = false,
    minZ=66.22,
    maxZ=73.82,
  }, {
    options = {
      {
        type = "client",
        event = "qb-constructionjob:client:startWorking",
        icon = "fa-solid fa-hammer",
        label = "Start Working",
        action = function(entity)
          if IsPedAPlayer(entity) then return false end
          TriggerEvent('qb-constructionjob:client:startWorking')
        end,
        canInteract = function(entity, distance, data)
          if IsPedAPlayer(entity) then return false end
          return true
        end,
        job = Config.Job,
      }
    },
    distance = 2.5,
  })
end


-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    spawnPeds()
    targetZones()
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
        spawnPeds()
        targetZones()
    end
end)

RegisterNetEvent('qb-constructionjob:client:startWorking', function()
    local playerJob = QBCore.Functions.GetPlayerData().job
    local ped = PlayerPedId()
    if playerJob.name == Config.Job then

            while (not HasAnimDictLoaded("missheistpaletoscore2mcs_2_p5")) do
                RequestAnimDict("missheistpaletoscore2mcs_2_p5")
                Wait(100)
            end
            TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, 1)
            FreezeEntityPosition(ped, true)
            local miniGame = exports['cd_keymaster']:StartKeyMaster()

            if miniGame then
                TriggerServerEvent('qb-constructionjob:server:Payment')
                QBCore.Functions.Notify('Good work, Engineer!', 'success')
                PlaySoundFrontend(-1, "COLLECTED", "HUD_AWARDS", 0)
            else
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                QBCore.Functions.Notify('You need to get back to college!', 'error')
                PlaySoundFrontend(-1, "MP_Flash", "WastedSounds", 0)
            end
            Wait(100)
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
    else
        QBCore.Functions.Notify('You are not an Engineer!', 'error')
    end
end)


