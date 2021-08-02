local alreadyspawned = false

RegisterServerEvent(Config.itemname..':server:getitem')
AddEventHandler(Config.itemname..':server:getitem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(Config.itemname, Config.numbertogive)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.itemname], "add")
end)

RegisterServerEvent(Config.itemname..':server:spawnobjects')
AddEventHandler(Config.itemname..':server:spawnobjects', function()
    if not alreadyspawned then
        print("QB-GATHERING : Started spawning models")
        for k, v in pairs(Config.locations["positions"]) do
            local pos = vector3(v.x, v.y, v.z)
            local objectid = CreateObject(Config.model, v.x+Config.offset[1], v.y+Config.offset[2], v.z+Config.offset[3], true, true, false)
            print("QB-GARHERING : Spawned object "..Config.model.." at position "..pos)
        end
        alreadyspawned = true
        print("QB-GATHERING : Finished spawning models")
    end
end)
