-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(display.contentWidth/2,display.contentHeight/2,
										display.contentWidth,display.contentHeight)
	background:setFillColor(1)

	local pond = display.newCircle(display.contentWidth*0.6,display.contentHeight/2,350)
	pond: setFillColor(0.5,0.8,1)

	local fish = {}
	local fishGroup = display.newGroup()

	for i = 1, 5 do
		fish[i] = display.newImage(fishGroup,"image/fish.png")
		fish[i].x,fish[i].y = pond.x+ 50*i, pond.y+50*i
	end
	fishGroup.x=fishGroup.x-150
	fishGroup.y=fishGroup.y-150

	local cat = display.newImageRect("image/cat.png", 150*1.2,200*1.2)
	cat.x,cat.y=display.contentWidth*0.4, display.contentHeight*0.8

	local score=0
	local showScore=display.newText(score,display.contentWidth*0.2,display.contentHeight*0.2)
	showScore:setFillColor(0)
	showScore.size=100
end


function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene