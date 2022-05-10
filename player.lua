Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight()/2
    self.width = 20
    self.height = 100
    self.speed = 500
end

function Player:update(dt)
    self:move(dt)
end

function Player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:move(dt)
    if self.y-2>0 and love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif self.y+self.height<love.graphics.getHeight() and love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end    
end