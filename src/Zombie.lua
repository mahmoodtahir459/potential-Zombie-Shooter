--Zombie Class
Zombie = Class{}

--Zombie Init
function Zombie:init(x, y, width, height, d)
   --Declare Zombies Data
    self.x = x
   self.y = y
   self.width = width
   self.height = height
   self.dx = d
   self.dy = d
end
--Zombie Update
function Zombie:update(dt)
    --Track player
    if player.y > self.y then
        self.y = self.y + self.dy
    else
        self.y = self.y - self.dy
    end
    if player.x > self.x then
        self.x = self.x + self.dx
    else
        self.x = self.x - self.dy
    end
end
--Zombie Render
function Zombie:render()
    --Render Zombie
   love.graphics.setColor(0, 127/255, 71, 1);
   love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
function Zombie:collsion()
    if self.x > player.x + player.width or player.x > self.x + self.width then
        return false
    end
    if self.y > player.y + player.height or player.y > self.y + self.height then
        return false
    end
        return true
end