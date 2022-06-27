local compass = { cardinal={}, intercardinal={}}

compass.show = true
compass.position = {x = 0.5, y = 0.042, centered = true}
compass.width = 0.22
compass.fov = 180
compass.followGameplayCam = true

compass.ticksBetweenCardinals = 9.0
compass.tickColour = {r = 255, g = 255, b = 255, a = 255}
compass.tickSize = {w = 0.001, h = 0.003}

compass.cardinal.textSize = 0.20
compass.cardinal.textOffset = 0.010
compass.cardinal.textColour = {r = 255, g = 255, b = 255, a = 255}

compass.cardinal.tickShow = true
compass.cardinal.tickSize = {w = 0.001, h = 0.012}
compass.cardinal.tickColour = {r = 255, g = 255, b = 255, a = 255}

compass.intercardinal.show = true
compass.intercardinal.textShow = true
compass.intercardinal.textSize = 0.15
compass.intercardinal.textOffset = 0.010
compass.intercardinal.textColour = {r = 255, g = 255, b = 255, a = 255}

compass.intercardinal.tickShow = true
compass.intercardinal.tickSize = {w = 0.001, h = 0.006}
compass.intercardinal.tickColour = {r = 255, g = 255, b = 255, a = 255}

disableHud = false

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(100)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if IsPedInAnyVehicle(playerPed, false) and IsPauseMenuActive() ~= 1 then
			SendNUIMessage({
				incar = true,
			})
		else
			SendNUIMessage({
				incar = false,
			})
		end
    end
end)