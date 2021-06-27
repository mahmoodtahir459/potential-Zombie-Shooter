--Zombie Class
Zombie = Class{}

--Zombie Init
function Zombie:init(x, y, width, height, d, player)
    --Declare Zombies Data
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dx = d
    self.dy = d
    self.player = player
end
--Zombie Update
function Zombie:update(dt)
    --Track player
    if self.player.y > self.y then
        self.y = self.y + self.dy
    else
        self.y = self.y - self.dy
    end
    if self.player.x > self.x then
        self.x = self.x + self.dx
    else
        self.x = self.x - self.dy
    end
end
--Zombie Render
function Zombie:render()
    --Render Zombie
    love.graphics.setColor(0, 127 / 255, 71, 1);
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
function Zombie:collsion()
    if self.x > self.player.x + self.player.width or self.player.x > self.x + self.width then
        return false
    end
    if self.y > self.player.y + self.player.height or self.player.y > self.y + self.height then
        return false
    end
    return true
end
function Zombie:collsionBul(bullets)
    for k, bullet in pairs(bullets) do
        if self.x > bullet.x + bullet.width or bullet.x > self.x + self.width then
            return false
        end
        if self.y > bullet.y + bullet.width or bullet.y > self.y + self.height then
            return false
        end
        table.remove(bullets,k)
        return true
    end
end