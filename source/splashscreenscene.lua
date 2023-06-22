--[[ 
    The games's splash screeen. Changes to gameplay after 3 seconds.
--]]

class("SplashScreenScene",
{
    
}).extends()

function SplashScreenScene:init()
    playdate.resetElapsedTime()
    playdate.graphics.drawTextAligned("Link's Awakening Overworld Demo\n\nMade by @PizzaFuelDev\nUpdated by NickSr", 200, 80, kTextAlignment.center)
end

function SplashScreenScene:update()
    print(playdate.getElapsedTime())
    if playdate.getElapsedTime() > 3 then
        changeScene("overworld")
    end
end