Config = {}

-- WHICH ITEM TO GIVE
Config.itemname  = "cocaleaf" -- Item name in shared.lua, Example : cocaleaf

-- TRANSLATION TEXT
Config.itemlabel = "Cocaine leaf" -- Example : Cocaine leaf
Config.gathertext = "Gather" -- Example : Gather
Config.gatheringtext = "Gathering" -- Example : Gathering
Config.canceledtext = "Canceled" -- Example : Canceled

-- ANIMATION TO PLAY
Config.animation = "prop_human_parking_meter" -- Animation played https://wiki.gtanet.work/index.php?title=Animations (example : WORLD_HUMAN_GARDENER_PLANT)

-- RANGE AND AMOUNT TO GIVE
Config.range = 2 -- Range to display the text
Config.numbertogive = 1 -- Number of items to give

-- DELAY
Config.delaymin = 10000 -- Minimum time to gather (delay will be random between delaymin and delaymax)
Config.delaymax = 20000 -- Maximum time to gather (delay will be random between delaymin and delaymax)

-- KEYS
Config.key = 47 -- Key = "G" https://docs.fivem.net/docs/game-references/controls/
Config.keytext = "G" -- Text to display for the key to press

-- GATHER LOCATIONS
Config.locations = {
    ["positions"] = { -- DON'T CHANGE
        [1] = vector3(125.0502, -415.475, 41.060), -- Position 1
        [2] = vector3(125.1127, -434.440, 41.067), -- Position 2
        [3] = vector3(113.5972, -423.159, 41.060)  -- Position 3
    }
}