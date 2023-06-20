--[[ 
    Player Class:
    - Moves Player
    - Handles Player Sprite
    - Handles collisions
--]]

class("OverworldPlayer",
{
    CurrentSprite = nil,
    Scene = nil
}).extends()

function OverworldPlayer:init(scene)
    self.Scene = scene
    self.CurrentSprite = AnimatedSprite.new(self.Scene.Images.Player_Walk_Down)
    self.CurrentSprite:moveTo(self.Scene.DefaultPlayerX, self.Scene.DefaultPlayerY)
    self.CurrentSprite:addState('idle',1,2,{ tickStep = 15 })
    self.CurrentSprite:setCollideRect(5,20,22,12)
    self.CurrentSprite:playAnimation()
end

-- Executed on every frame
function OverworldPlayer:update()
    x, y = self.CurrentSprite:getPosition()

    if not(self.CurrentSprite._enabled) then
        self.CurrentSprite:playAnimation()
    end

    -- Calculates how far the player will move
    -- moveDistance = self.Scene.ElapsedTime * 100
    moveDistance = 2
    if playdate.buttonIsPressed(playdate.kButtonB) then
        moveDistance *= 2 end

    -- Handle player movement
    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        self:changeDirection("walk_left")
        self.CurrentSprite:moveWithCollisions(x - moveDistance, y)
    elseif playdate.buttonIsPressed(playdate.kButtonRight) then
        self:changeDirection("walk_right")
        self.CurrentSprite:moveWithCollisions(x + moveDistance, y)
    elseif playdate.buttonIsPressed(playdate.kButtonUp) then
        self:changeDirection("walk_up")
        self.CurrentSprite:moveWithCollisions(x, y - moveDistance)
    elseif playdate.buttonIsPressed(playdate.kButtonDown) then
        self:changeDirection("walk_down")
        self.CurrentSprite:moveWithCollisions(x, y + moveDistance)
    else 
        -- Pause animation if no direction is pressed
        self.CurrentSprite:pauseAnimation()
    end
end

-- Updates Player Sprite if needed
function OverworldPlayer:changeDirection(direction)
    newSprite = nil

    if direction == "walk_up" then
        newSprite = self.Scene.Images.Player_Walk_Up
    elseif direction == "walk_left" then
        newSprite = self.Scene.Images.Player_Walk_Left
    elseif direction == "walk_right" then
        newSprite = self.Scene.Images.Player_Walk_Right
    elseif direction == "walk_down" then
        newSprite = self.Scene.Images.Player_Walk_Down
    end

    -- Replace Player Sprite if new direction was chosen
    if newSprite ~= nil and self.CurrentSprite.imagetable ~= newSprite then
        x, y = self.CurrentSprite:getPosition()
        self.CurrentSprite:remove()
        self.CurrentSprite = AnimatedSprite.new(newSprite)
        self.CurrentSprite:moveTo(x, y)
        self.CurrentSprite:setCollideRect(5,20,22,12)
        self.CurrentSprite:addState('idle',1,2,{ tickStep = 15 })
        self.CurrentSprite:playAnimation()
    end
end