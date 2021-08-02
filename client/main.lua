local gathering = false

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    TriggerServerEvent(Config.itemname..':server:spawnobjects')
    while true do
        local PlayerPed = PlayerPedId()
        local PlayerPos = GetEntityCoords(PlayerPed)
        for k, v in pairs(Config.locations["positions"]) do
            local pos = vector3(v.x, v.y, v.z)
            local distance = #(PlayerPos - pos)
            if Isanyrange(PlayerPos) then
                if (distance < Config.range) == true then
                    DrawText3Ds(v.x,v.y,v.z, "~g~["..Config.keytext.."] ~w~ " .. Config.gathertext .." ".. Config.itemlabel)
                    if IsControlJustPressed(0, Config.key) then
                        pickProcess()
                    end
                end
            else
                Citizen.Wait(2000)
            end
        end
        Citizen.Wait(3)
    end
end)

function Isanyrange(playerpos)
    for k, v in pairs(Config.locations["positions"]) do
        local distance = #(playerpos - vector3(v.x, v.y, v.z))
        if distance < Config.range then
            return true
        end
    end
end

function pickProcess()
    PrepareAnim()
    gathering = true
    QBCore.Functions.Progressbar("gathering", Config.gatheringtext.." ".. Config.itemlabel, math.random(Config.delaymin,Config.delaymax), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent(Config.itemname..":server:getitem")
        ClearPedTasks(PlayerPedId())
        gathering = false
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.canceledtext, "error")
    end)
end

function PrepareAnim()
    local ped = PlayerPedId()
    -- LoadAnim('amb@prop_human_bbq@male@idle_a')
    -- TaskPlayAnim(ped, 'amb@prop_human_bbq@male@idle_a', 'idle_b', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
    TaskStartScenarioInPlace(ped, Config.animation, 0, true)
    PreparingAnimCheck()
end

function PreparingAnimCheck()
    gathering = true
    Citizen.CreateThread(function()
        while true do
            local ped = PlayerPedId()

            if gathering then
                -- if not TaskStartScenarioInPlace(ped, Config.animation, 0, true) then
                --     TaskStartScenarioInPlace(ped, Config.animation, 0, true)
                -- end
            else
                ClearPedTasks(ped)
                break
            end
            Citizen.Wait(1000)
        end
    end)
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end
