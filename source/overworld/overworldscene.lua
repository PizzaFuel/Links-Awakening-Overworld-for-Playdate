--[[ 
    Overworld Scene:
    - Imports, intializes and updates all overworld clases
    - Handles camera movement
--]]

import "overworld/overworldplayer"
import "overworld/overworldimages"

class("OverworldScene",
{
    Player = nil,
    Images = OverworldImages(),
    Background = nil,
    DefaultPlayerX = 200,
    DefaultPlayerY = 120,
    Song = nil,
    ElapsedTime = 0,
}).extends()

function OverworldScene:init()
    self.Player = OverworldPlayer(self)
    self.Background = playdate.graphics.sprite.new(self.Images.Background)
    self.Background:moveTo(2020, -511)
    self.Background:setZIndex(-1)
    self.Background:add()
    self.Song = playdate.sound.sampleplayer.new("sounds/theme")
    self.Song:play(100)
    playdate.resetElapsedTime()
end

function OverworldScene:update()
    -- Get Elapsed Time to allow variable framerates
    self.ElapsedTime = playdate.getElapsedTime()
    playdate.resetElapsedTime()

    -- Update all objects on the overworld
    self.Player:update()

    -- Reset Player Position to center
    playerX, playerY = self.Player.CurrentSprite:getPosition()
    self.Player.CurrentSprite:moveTo(self.DefaultPlayerX, self.DefaultPlayerY)

    -- Moves camera using the difference in player positions.
    -- This code should be executed for every object, except for the player
    x, y = self.Background:getPosition()
    self.Background:moveTo(x + self.DefaultPlayerX - playerX, y + self.DefaultPlayerY - playerY)

    -- Update Screen
    playdate.graphics.sprite.update()
end