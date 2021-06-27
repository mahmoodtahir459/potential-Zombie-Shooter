--Human Player Class
Human = Class{}
--Init Function
function Human:init(x, y)
    --Declare Values of Human
    self.x = x
    self.y = y
    self.d = 3
    self.mousePres = false
    self.width = gImages['Character']:getWidth()
    self.height = gImages['Character']:getHeight()
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
        self.y = self.y - self.d
    elseif love.keyboard.isDown('s') then
        self.y = self.y + self.d
    end
    if love.keyboard.isDown('a') then
        self.x = self.x - self.d
    elseif love.keyboard.isDown('d') then
        self.x = self.x + self.d
    end
end
--Render Human
function Human:render()
    love.graphics.draw(gImages['Character'], self.x, self.y)
end