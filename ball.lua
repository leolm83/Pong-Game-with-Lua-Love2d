Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth()/2
    self.y = love.graphics.getHeight()/2
    self.width = 20
    self.height = 20
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:collide()
    --collision with player
    if checkCollision(self,Player) then
        self.xVel = self.speed --positive because the ball needs to go back to the AI
        local middleBall = self.y + self.height/2
        local middlePlayer = Player.y + Player.height/2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end
    -- collision with Ai
    if checkCollision(self,AI) then
        self.xVel = -self.speed --negative because the ball needs to go back to player
        local middleBall = self.y + self.height/2
        local middleAi = AI.y + AI.height/2
        local collisionPosition = middleBall - middleAi
        self.yVel = collisionPosition * 5
    end

    --collide with de bottom and top of screen
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then 
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    if self.x<0 or self.x+self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth()/2
        self.xVel = -self.xVel
    end
end