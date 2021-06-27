-- get all Dependencies
require 'src/Dependencies'
--Love Function Load
function love.load()
    --Fonts
    bebasFont = love.graphics.newFont('fonts/BebasNeue-Regular.ttf', 40)
    gSounds = {
        ['BulletShoot'] = love.audio.newSource('Sounds/BulletShoot.wav', 'static')
    }
    gImages = {
        ['targetPng'] = love.graphics.newImage('Images/Target.png'),
        ['Character'] = love.graphics.newImage('Images/Character.png')
    }
    --Randomseed
    math.randomseed(os.time())
    --StateMachine
    gStateMachine = StateMachine{
            --StartScreen Start
            ['start'] = function() return StartState() end,
            --Play State
            ['play'] = function() return PlayState() end,
            --Victory State
            ['victory'] = function() return VictoryState() end
    }
    --Grapgucs
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Unammed')
    --Push set Virtual Size
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })
    --Set StateMachine to Start
    gStateMachine:change('start')
    --KeyPress Global
    love.keyboard.keysPressed = {}
end
--Rezie Function
function love.resize(w, h)
    --Push Rezie Function
    push:resize(w, h)
end
--Update Function
function love.update(dt)
    --Get State Machine update
    gStateMachine:update(dt)
    --Reset KeysPressed
    love.keyboard.keysPressed = {}
end
--Draw Function
function love.draw()
    --Draw in Push virtual Width and Height
    push:apply('start')
    --Render StateMachine State Render
    gStateMachine:render()
    displayFPS()
    push:apply('end')
end
--Get FPS and Display it
function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(bebasFont)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 5, 5)
end
--Dectet Key press and record in table WasPressed to make global
function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end
--Dectet if certain Key was pressed returns true or false
function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end
