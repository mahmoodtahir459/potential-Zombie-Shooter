Bullet = Class{}
function Bullet:init(x, y, key)
    self.x = x
    self.y = y
    self.dy = 15
    self.dx = 15
    self.key = key
end
function Bullet:update()
    if self.key == "wa" then
        self.y = self.y - self.dy
        self.x = self.x - self.dx
    end
    if self.key == "wd" then
        self.y = self.y - self.dy
        self.x = self.x + self.dx
    end
    if self.key == "sa" then
        self.y = self.y + self.dy
        self.x = self.x - self.dx
    end
    if self.key == "sd" then
        self.y = self.y + self.dy
        self.x = self.x + self.dx
    end
    if self.key == 'w' then
        self.y = self.y - self.dy
    end
    if self.key == 's' then
        self.y = self.y + self.dy
    end
    if self.key == 'a' then
        self.x = self.x - self.dx
    end
    if self.key == 'd' then
        self.x = self.x + self.dx
    end
    if self.key == 'space' then
        self.x = self.x + self.dx
    end
end
function Bullet:render()
    love.graphics.setColor(252/255, 211/255, 3/255, 1)
    love.graphics.rectangle('fill', self.x-2.5, self.y-2.5, 5, 5)
end