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
        local z = Zombie(math.random(800), math.random(600), 20, 20, math.random(),math.random())
        --Insert into Table
        table.insert(self.zombs, z)
    end
end
--Update Function
function PlayState:update(dt)
    --If Key pressed is Escape quit Game
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
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
    --Player Render
    player:render()
    --Each Zombie Render
    for k, z in pairs(self.zombs) do
        z:render()
    end
end
