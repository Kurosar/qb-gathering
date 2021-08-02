This is a basic gathering/farming script made for QB-Core to give a certain amount of items to a player after he interacts on one of the gathering locations.  

**Features :**   
- Localisable  
- Extensive configuration file  
- Multiple gathering locations  
- Spawns a specified model on the gathering location

You can also copy/paste the folder and rename it to create a new type of farming/gathering location (since everything is configurable in config.lua)  

**Screenshot**   
![image](https://user-images.githubusercontent.com/4887819/127907608-ae6bbd4f-5b2e-449d-9fa3-530d85845344.png)  
![image](https://user-images.githubusercontent.com/4887819/127908134-4337c316-cbcf-46ff-b76e-61d00673175d.png)


```lua
Config = {}

-- WHICH ITEM TO GIVE
Config.itemname  = "weed_skunk" -- Item name in shared.lua, Example : cocaleaf

-- TRANSLATION TEXT
Config.itemlabel = "Weed" -- Example : Cocaine leaf
Config.gathertext = "Gather" -- Example : Gather
Config.gatheringtext = "Gathering" -- Example : Gathering
Config.canceledtext = "Canceled" -- Example : Canceled

-- OBJECT TYPE AND OFFSET
Config.model = "Prop_weed_01" -- Example : Prop_weed_01 http://www.test.raccoon72.ru/?c=ext_veg
Config.offset = vector3(0,0,-1) -- Object position offset

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
        [1] = vector3(556.6391, 786.7302, 200.50), -- Position 1
        [2] = vector3(125.1127, -434.440, 41.067), -- Position 2
        [3] = vector3(113.5972, -423.159, 41.060)  -- Position 3
    }
}
```

**Be careful :** The objects are spawned the first time a player joins the server, if you restart qb-gathering, it will spawn new objects on top of the old ones !  
Preferably try to use the delete laser to remove the old qb-gathering objects if you intend to restart the script.  
  
[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FKurosar%2Fqb-gathering&count_bg=%2379C83D&title_bg=%23555555&icon=github.svg&icon_color=%23E7E7E7&title=visitors&edge_flat=true)](https://hits.seeyoufarm.com)
