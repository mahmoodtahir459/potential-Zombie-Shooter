Bullet = Class{}
function Bullet:init(x, y)
    self.x = x + 10
    self.y = y + 10
    self.dy = 1
    self.dx = 1
    self.width = 5
    self.height = 5
    self.mouseX = love.mouse.getX() - 12
    self.mouseY = love.mouse.getY() - 12
    self.Vy = self.mouseY - y
    self.Vx = self.mouseX - x
    self.M = math.sqrt((self.mouseX - x)^2 + (self.mouseY - y)^2 )
    self.Vy = self.Vy/self.M
    self.Vx = self.Vx/self.M
end
function Bullet:update()
    self.x = self.x + self.Vx * 15
    self.y = self.y + self.Vy * 15
end
function Bullet:render()
    love.graphics.setColor(252 / 255, 211 / 255, 3 / 255, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
function Bullet:collsion()
    if self.x < 0 then
        return true
    end
    if self.x + self.width > VIRTUAL_WIDTH then
        return true
    end
    if self.y < 0 then
        return true
    end
    if self.y + self.height > VIRTUAL_HEIGHT then
        return true
    end
    return false
end
