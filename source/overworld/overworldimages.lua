--[[ 
    Overworld Images Handler:
    - Loads all used images and imagetables on startup for performance optimization
--]]

class("OverworldImages",
{
    Player_Walk_Up = playdate.graphics.imagetable.new("images/assets/player/walk/up"),
    Player_Walk_Left = playdate.graphics.imagetable.new("images/assets/player/walk/left"),
    Player_Walk_Right = playdate.graphics.imagetable.new("images/assets/player/walk/right"),
    Player_Walk_Down = playdate.graphics.imagetable.new("images/assets/player/walk/down"),
    Background = playdate.graphics.image.new("images/assets/map"):scaledImage(3)
}).extends()

function OverworldImages:init()

end

function OverworldImages:update()

end