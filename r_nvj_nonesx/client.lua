-- Script Made by NeyZzO For Redfive Rp 
local config = Config --Don't touch that
enabled = 0 --Don't touch that
local PlayerData = {} --Don't touch that

local PlayerPed = GetPlayerPed(-1)

RegisterKeyMapping("++nvj" , "Activate Night Vision", "KEYBOARD", Config.control)

RegisterCommand("++nvj", function(src, args, command)

    loadAnimDict("anim@amb@casino@brawl@reacts@hr_blackjack@")

    local PlySkin = {
        ['helmet_1'] = GetPedPropIndex(PlayerPed, 0),
        ['helmet_2'] = GetPedPropTextureIndex(PlayerPed, 0),
    }

    -- TriggerEvent('skinchanger:getSkin', function(skin)
    --     PlySkin = skin
    -- end)
    if config.useeup == true then 
        if enabled == 0 then
            if PlySkin['helmet_1'] == Config.off then
               enabled = 1

                SetPedPropIndex(
                    PlayerPed, 
                    0, 
                    Config.on, 
                    PlySkin['helmet_2'],
                    true
                )

                Citizen.Wait(0.5)
                SetNightvision(true)
            else
                SetNightvision(false)
                enabled = 1
            end
        elseif enabled == 1 then
            if PlySkin['helmet_1'] == Config.on then
                enabled = 0

                SetPedPropIndex(
                    PlayerPed, 
                    0, 
                    Config.off, 
                    PlySkin['helmet_2'], 
                    true
                )
                TaskPlayAnim(ped, "anim@amb@casino@brawl@reacts@hr_blackjack@", "headslam_react_male_01", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                Citizen.Wait(0.5)
                SetNightvision(false)
            end
        end
    else
        if enabled == 0 then
            enabled = 1
            Citizen.Wait(0.5)
            SetNightvision(true)
        elseif enabled == 1 then
            enabled = 0
            Citizen.Wait(0.5)
            SetNightvision(false)

        end
    end

end, false)


function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end
