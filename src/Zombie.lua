Zombie = Class{}

function Zombie:init(x, y, width, height, dx, dy)
   self.x = x
   self.y = y
   self.width = width
   self.height = height
   self.dx = dx
   self.dy = dy
end
function Zombie:update(dt)
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
function Zombie:render()
   love.graphics.setColor(0, 127/255, 71, 1);
   love.graphics.rectangle('fill', self.x, self.y, self.width, self.height) 
end