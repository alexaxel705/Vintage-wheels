-- name/ scale
local CustomModels = {
	[400] = {"wheels/wheel_alloy64.png", 0.8}, 
	[401] = {"wheels/wheel_truck64.png", 0.8}, 
	[402] = {"wheels/whee_rim64.png", 0.7}, 
	[403] = {"wheels/wheel_truck64.png", 1.2}, 
	[404] = {"wheels/wheel_classic64.png", 0.7}, 
	[405] = {"wheels/wheel_saloon64.png", 0.7}, 
	[406] = {"wheels/wheel_offroad64.png", 2.5}, 
	[407] = {"wheels/wheel_truck64.png", 1}, 
	[408] = {"wheels/wheel_truck64.png", 1.1}, 
	[409] = {"wheels/wheel_classic64.png", 0.7}, 
	[410] = {"wheels/wheel_smallcar64.png", 0.6}, 
	[411] = {"wheels/whee_rim64.png", 0.7}, 
	[412] = {"wheels/wheel_classic64.png", 0.7}, 
	[413] = {"wheels/wheel_lightvan64.png", 0.8}, 
	[414] = {"wheels/wheel_truck64.png", 0.8}, 
	[415] = {"wheels/wheel_alloy64.png", 0.7}, 
	[416] = {"wheels/wheel_truck64.png", 0.9}, 
	[417] = {"wheels/wheel_classic64.png", 0.6}, 
	[418] = {"wheels/wheel_lightvan64.png", 0.7}, 
	[419] = {"wheels/wheel_classic64.png", 0.7}, 
	[420] = {"wheels/wheel_sport64.png", 0.7}, 
	[421] = {"wheels/wheel_saloon64.png", 0.7}, 
	[422] = {"wheels/wheel_lightvan64.png", 0.7}, 
	[423] = {"wheels/wheel_lightvan64.png", 0.7}, 
	[424] = {"wheels/wheel_offroad64.png", 0.9}, 
	[425] = {"wheels/wheel_classic64.png", 0.6}, 
	[426] = {"wheels/wheel_sport64.png", 0.7}, 
	[427] = {"wheels/wheel_truck64.png", 0.9}, 
	[428] = {"wheels/wheel_truck64.png", 0.9}, 
	[429] = {"wheels/whee_rim64.png", 0.7}, 
	[430] = false, 
	[431] = {"wheels/wheel_truck64.png", 1}, 
	[432] = false, 
	[433] = {"wheels/wheel_truck64.png", 1.2}, 
	[434] = {"wheels/wheel_sport64.png", 0.8}, 
	[435] = {"wheels/wheel_truck64.png", 1.2}, 
	[436] = {"wheels/wheel_smallcar64.png", 0.7}, 
	[437] = {"wheels/wheel_truck64.png", 1}, 
	[438] = {"wheels/wheel_classic64.png", 0.7}, 
	[439] = {"wheels/wheel_classic64.png", 0.7}, 
	[440] = {"wheels/wheel_lightvan64.png", 0.7}, 
	[441] = false, 
	[442] = {"wheels/wheel_classic64.png", 0.7}, 
	[443] = {"wheels/wheel_truck64.png", 1.2}, 
	[444] = {"wheels/wheel_offroad64.png", 1.6}, 
	[445] = {"wheels/wheel_alloy64.png", 0.7}, 
	[446] = false, 
	[447] = false, 
	[448] = false, 
	[449] = false, 
	[450] = {"wheels/wheel_truck64.png", 1.2}, 
	[451] = {"wheels/whee_rim64.png", 0.7}, 
	[452] = false, 
	[453] = false, 
	[454] = false, 
	[455] = {"wheels/wheel_truck64.png", 1.2}, 
	[456] = {"wheels/wheel_lighttruck64.png", 0.9}, 
	[457] = {"wheels/wheel_saloon64.png", 0.5}, 
	[458] = {"wheels/wheel_saloon64.png", 0.7}, 
	[459] = {"wheels/wheel_lightvan64.png", 0.7}, 
	[460] = false,
	[461] = false,
	[462] = false,
	[463] = false,
	[464] = false,
	[465] = false,
	[466] = {"wheels/wheel_classic64.png", 0.7}, 
	[467] = {"wheels/wheel_classic64.png", 0.7}, 
	[468] = false,
	[469] = false,
	[470] = {"wheels/wheel_offroad64.png", 0.9},
	[471] = false,
	[472] = false,
	[473] = false,
	[474] = {"wheels/wheel_classic64.png", 0.7}, 
	[475] = {"wheels/wheel_classic64.png", 0.7}, 
	
	
	
	
	[467] = {"wheels/wheel_classic64.png", 0.7}, 
	
	[666] = {"wheels/wheel_truck64.png", 0.9}, 
}



function VehStreamIn()
	if(getElementType(source) == "vehicle") then
		local model = getElementData(source, "model") or getElementModel(source)
		if(CustomModels[model]) then
			addVehicleCustomWheel(source, CustomModels[model][1], CustomModels[model][2])
		end
	end
end
addEvent("onClientElementStreamIn", true)
addEventHandler("onClientElementStreamIn", getRootElement(), VehStreamIn)


function VehStreamOut()
	if(getElementType(source) == "vehicle") then
		removeVehicleCustomWheel(source)
	end
end
addEvent("onClientElementStreamOut", true)
addEventHandler("onClientElementStreamOut", getRootElement(), VehStreamOut)





local createdCustomWheels = {}

local WheelsTexture = {
	["wheels/wheel_truck64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_sport64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_smallcar64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_saloon64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_offroad64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_lightvan64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_lighttruck64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_classic64.png"] = dxCreateShader("shader.fx"),
	["wheels/wheel_alloy64.png"] = dxCreateShader("shader.fx"),
	["wheels/whee_rim64.png"] = dxCreateShader("shader.fx"),
}


for name, _ in pairs(WheelsTexture) do
	dxSetShaderValue(WheelsTexture[name], "gTexture", dxCreateTexture(name))
end


local tyretread_64H = dxCreateShader("shader.fx")
local typetexture = dxCreateTexture("wheels/tyre64a.png")
dxSetShaderValue(tyretread_64H, "gTexture", typetexture)



function removeVehicleCustomWheel(theVehicle)
	for _, wheel in pairs(createdCustomWheels[theVehicle] or {}) do
		setVehicleComponentVisible(theVehicle, wheel.name, true)
		destroyElement(wheel.object)
	end
	createdCustomWheels[theVehicle] = nil
end



function addVehicleCustomWheel(theVehicle, model, wscale)
	removeVehicleCustomWheel(theVehicle)
	local wheels = {"wheel_lf_dummy", "wheel_rf_dummy", "wheel_lb_dummy", "wheel_rb_dummy", "wheel_lm_dummy", "wheel_rm_dummy"}
	
	setVehicleComponentVisible(theVehicle, "extra_", false) -- for trailer
	setVehicleComponentVisible(theVehicle, "extra__", false) -- for trailer
	
	for i = 1, #wheels do
		setVehicleComponentVisible(theVehicle, wheels[i], false)

		local wheel = {
			name = wheels[i],
			object = createObject(1327, Vector3(), Vector3(), true),
		}
	
		engineApplyShaderToWorldTexture(tyretread_64H, "tyretread_64H", wheel.object)
		engineApplyShaderToWorldTexture(WheelsTexture[model], "junk_tyre", wheel.object)
	
		setElementParent(wheel.object, theVehicle)
		setElementCollisionsEnabled(wheel.object, false)
		setObjectScale(wheel.object, tonumber(wscale)/2 or 0.7)
		wheels[i] = wheel
	end

	createdCustomWheels[theVehicle] = wheels
end



function calculateVehicleWheelRotation(theVehicle, wheel)
	if(type(wheel) == 'table') and (#wheel > 0) then
		for i = 1, #wheel do
			calculateVehicleWheelRotation(theVehicle, wheel[i])
		end
		return
	end

	if(wheel.object) then
		local rotation = Vector3(getVehicleComponentRotation(theVehicle, wheel.name, 'world'))
		local position = Vector3(getVehicleComponentPosition(theVehicle, wheel.name, 'world'))
		
		local radis = getElementRadius(wheel.object)
		
		setElementPosition(wheel.object, position)
		
		local x,y,z = getPositionFromElementOffset(wheel.object, 1.16-radis,0,0)
		setElementPosition(wheel.object, x,y,z)
		setElementRotation(wheel.object, rotation, "ZYX")
	end
end


function getPositionFromElementOffset(element,offX,offY,offZ) 
    local m = getElementMatrix(element)
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
    return x, y, z
end 






addEventHandler('onClientPreRender', root,
	function()
		for theVehicle, wheels in pairs(createdCustomWheels) do
			calculateVehicleWheelRotation(theVehicle, wheels)
		end
	end
)





function Start()
	for _, theVehicle in pairs(getElementsByType("vehicle", getRootElement(), true)) do
		triggerEvent("onClientElementStreamIn", theVehicle)
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(), Start)



function Stop()
	for theVehicle, _ in pairs(createdCustomWheels) do
		removeVehicleCustomWheel(theVehicle)
	end
end
addEventHandler("onClientResourceStop", getResourceRootElement(), Stop)

