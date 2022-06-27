local streetName = {}

streetName.show = true
streetName.position = {x = 0.5, y = 0.02, centered = true}
streetName.textSize = 0.35
streetName.textColour = {r = 255, g = 255, b = 255, a = 255}
local display = true

Citizen.CreateThread( function()
	local lastStreetA = 0
	local lastStreetB = 0
	local lastStreetName = ''
	
	while streetName.show do
		Wait(500)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if display then
			local playerPos = GetEntityCoords( GetPlayerPed( -1 ), true )
			local streetA, streetB = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
			local street = {}

			if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
				lastStreetA = streetA
				lastStreetB = streetB
			end
			
			if lastStreetA ~= 0 then
				table.insert( street, GetStreetNameFromHashKey( lastStreetA ) )
			end
			
			if lastStreetB ~= 0 then
				table.insert( street, GetStreetNameFromHashKey( lastStreetB ) )
			end
			local fullStreetName = table.concat( street, " & " )
			if(lastStreetName ~= fullStreetName) then
				lastStreetName = fullStreetName
				SendNUIMessage({
					action = "setStreetName",
					streetname = fullStreetName,
				})
			end
		end
	end
end)


function ToggleCompass()
	SendNUIMessage({
		action = 'togglecompass'
	})
end

RegisterCommand("togglecompass", function(source, args)
	ToggleCompass()
	display = not display
	print(display)
	TriggerEvent("velocimetro:update", display)
end)
