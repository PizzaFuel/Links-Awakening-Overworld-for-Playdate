-- Source: https://github.com/PizzaFuel/Links-Awakening-Overworld-for-Playdate

--[[ 
    Main:
    - Handles Settings
	- Initializes OverworldScene
	- Displays FPS if needed
	- Handles main imports
--]]

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "import/animiatedsprite"
import "overworld/overworldscene"
import "splashscreenscene"

local currentScene = SplashScreenScene()
local showFPS = false


local function initialize()
	playdate.display.setRefreshRate(50)
end

-- Executed on every frame
function playdate.update()
	currentScene:update()
	if showFPS then
		playdate.drawFPS(0,0) end
end

-- Very simple scene handler:
function changeScene(scenename)
	if scenename == "overworld" then
		currentScene = OverworldScene()
	end
end

initialize()

-- Toggle FPS shown on or off
local menu = playdate.getSystemMenu()
local checkmarkMenuItem, error = menu:addCheckmarkMenuItem("Show FPS", false, function(value)
    showFPS = value
end)
