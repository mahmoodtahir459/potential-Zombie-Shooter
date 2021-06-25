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
    self.bullets = {}
end
--Update Function
function PlayState:update(dt)
    --If Key pressed is Escape quit Game
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
    --Create Bullet if Space Pressed
    --Find Keys that are Pressed and GO that direction if No keys are pressed go East
    if love.keyboard.wasPressed('space') then
        if love.keyboard.isDown('w') and love.keyboard.isDown('a') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'wa')
            table.insert(self.bullets, bullet)
            print('Bullet UP LEFT')
        elseif love.keyboard.isDown('s') and love.keyboard.isDown('a') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'sa')
            table.insert(self.bullets, bullet)
            print('Bullet DOWN LEFT')
        elseif love.keyboard.isDown('w') and love.keyboard.isDown('d') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'wd')
            table.insert(self.bullets, bullet)
            print('Bullet UP RIGHT')
        elseif love.keyboard.isDown('s') and love.keyboard.isDown('d') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'sd')
            table.insert(self.bullets, bullet)
            print('Bullet DOWN RIGH')
        elseif love.keyboard.isDown('w') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'w')
            table.insert(self.bullets, bullet)
            print('Bullet Up')
        elseif love.keyboard.isDown('s') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 's')
            table.insert(self.bullets, bullet)
            print('Bullet south')
        elseif love.keyboard.isDown('a') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'a')
            table.insert(self.bullets, bullet)
            print('Bullet left')
        elseif love.keyboard.isDown('d') then
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'd')
            table.insert(self.bullets, bullet)
            print('Bullet right')
        else
            local bullet = Bullet(player.x + player.width / 2, player.y + player.height / 2, 'd')
            table.insert(self.bullets, bullet)
            print('Bullet No But')
        end
    end
    for k, bullet in pairs(self.bullets) do
        bullet:update()
    end
    -- Call the Player Update
    player:update(dt)
    --Call each Zombies update Function
    for k, z in pairs(self.zombs) do
        z:update()
        if z:collsion() == true then
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
end
