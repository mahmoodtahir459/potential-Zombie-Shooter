--Human Player Class
Human = Class{}
--Init Function
function Human:init(x, y, width, height)
    --Declare Values of Human
    self.x = x
    self.y = y
    self.width = width
    self.height = height
end
--Update Function
function Human:update(dt)
    --If statement to detect Collision with Wall
    if self.x + self.width > VIRTUAL_WIDTH then
        self.x = VIRTUAL_WIDTH - self.width
    end
    if self.x < 0 then
        self.x = 0;
    end
    if self.y < 0 then
        self.y = 0
    end
    if self.y + self.height > VIRTUAL_HEIGHT then
        self.y = VIRTUAL_HEIGHT - self.height
    end
    --Movement Controls
    if love.keyboard.isDown('w') then
        self.y = self.y - 1
    elseif love.keyboard.isDown('s') then
        self.y = self.y + 1
    end
    if love.keyboard.isDown('a') then
        self.x = self.x - 1
    elseif love.keyboard.isDown('d') then
        self.x = self.x + 1
    end
end
--Render Human
function Human:render()
    love.graphics.setColor(255/255, 81/255, 57/255, 1)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end