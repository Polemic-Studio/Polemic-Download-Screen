-- Author script: Polemic.
-- Dont remove note author.

local rot = 0
local czas = getTickCount()
local font = dxCreateFont("fonty/font.ttf", 11)
local screenW, screenH = guiGetScreenSize()

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
	return false
end

function loadingDownload()
  
       local Alpha = interpolateBetween(0, 0, 0, 255, 220, 200, ((getTickCount() - czas) / 1000), "Linear") 
  local r,g,b,a=interpolateBetween(40,40,40,255,255,255,(getTickCount())/6500,"SineCurve") 
  local kr1, kr2, kr3 = interpolateBetween(-0.2630, 0.0368, 0, 0.2530, 0, 0, (getTickCount())/6500,"SineCurve")
	rot = rot + 5 > 360 and 0 or rot + 5
        dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0400, screenH * 1.0000, "images/background.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
        dxDrawImage(screenW * 0., screenH * 0., screenW * 0.1800, screenH * 0.1800, "images/loading.png", rot, 0, 0, tocolor(255, 255, 255, Alpha), false)
 
end


function loadingObjects()
  
       local Alpha = interpolateBetween(0, 0, 0, 255, 220, 200, ((getTickCount() - czas) / 1000), "Linear") 
  local r,g,b,a=interpolateBetween(40,40,40,255,255,255,(getTickCount())/6500,"SineCurve") 
  local kr1, kr2, kr3 = interpolateBetween(-0.2630, 0.0368, 0, 0.2530, 0, 0, (getTickCount())/6500,"SineCurve")
	rot = rot + 5 > 360 and 0 or rot + 5
        dxDrawImage(screenW * 0.0000, screenH * 0.0000, screenW * 1.0400, screenH * 1.0000, "images/background.png", 0, 0, 0, tocolor(255, 255, 255, Alpha), false)
        dxDrawImage(screenW * 0, screenH * 0.0210, screenW * 0.0195, screenH * 0.0340, "images/loading.png", rot, 0, 0, tocolor(255, 255, 255, Alpha), false)
        
end

function checkingIsDownload()
	if isTransferBoxActive() == true then
		addEventHandler("onClientRender", root, loadingDownload)
	else
		if isEventHandlerAdded("onClientRender", root, loadingDownload) then
			removeEventHandler("onClientRender", root, loadingDownload)
		end
	end
end
setTimer(checkingIsDownload, 2000, 0)

function checkingIsComingObject()
	if getElementData(root, "load:objects") then
		addEventHandler("onClientRender", root, loadingObjects)
	else
		if isEventHandlerAdded("onClientRender", root, loadingObjects) then
			removeEventHandler("onClientRender", root, loadingObjects)
		end
	end
end
setTimer(checkingIsComingObject, 1000, 0)

addEventHandler("onClientRender", root, loadingDownload)
