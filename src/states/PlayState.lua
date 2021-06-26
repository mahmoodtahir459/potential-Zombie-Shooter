PlayState = Class{__includes = BaseState}

--Initilize the playState
function PlayState:enter(params)
    --Declare a Zombie table
    self.zombs = {}
    --Set the Current Level
    self.level = params.level
    --Get the diffculty for the Level
    local diffculty = math.random(6, 10) * self.level
    --Add Zombies to table
    for i = 0, diffculty do
        --random Functions for Spawning
        local z = Zombie(math.random(800), math.random(600), 20, 20, math.random())
        --Insert into Table
        table.insert(self.zombs, z)
    end
    self.bulletAllow = true
    self.bullets = {}
    self.mouseX = 0
    self.mouseY = 0
    self.bulletTimer = 0
end
--Update Function
function PlayState:update(dt)
    love.mouse.setVisible(false)
    self.bulletTimer = self.bulletTimer + dt
    --If Key pressed is Escape quit Game
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    
    if love.mouse.isDown(1) then
        if self.bulletTimer > 1 then
            local bullet = Bullet(player.x, player.y)
            table.insert(self.bullets, bullet)
            gSounds['BulletShoot']:play()
            self.bulletTimer = 0
        end
    end
    for k, bullet in pairs(self.bullets) do
        bullet:update()
        if bullet:collsion() == true then
            table.remove(self.bullets, k)
        end
    end
    -- Call the Player Update
    player:update(dt)
    --Call each Zombies update Function
    for k, z in pairs(self.zombs) do
        z:update()
        if z:collsionBul(self.bullets) == true then
            table.remove(self.zombs, k)
        end
    end
    if #self.zombs == 0 then
        gStateMachine:change('victory', {
            level = self.level + 1
        })
    end
end
--Render Function
function PlayState:render()
    for k, bullet in pairs(self.bullets) do
        bullet:render()
    end
    --Player Render
    player:render()
    --Each Zombie Render
    for k, z in pairs(self.zombs) do
        z:render()
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gImages['targetPng'], love.mouse.getX(), love.mouse.getY())
end
