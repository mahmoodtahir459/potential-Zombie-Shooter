--StartState Class
--StartStae Inherits BaseState Functions
StartState = Class{__includes = BaseState}
--Start State Update Function
function StartState:update(dt)
    --If Enter Was pressed then change state to Play
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
    --If escape is Pressed Quit Game
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end
--Start State Render
function StartState:render()
    --Set COlors to Green
    love.graphics.setColor(0, 1, 0, 1)
    --Display Title and Following Text
    love.graphics.printf("Zombie Shooter", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press Enter to Start", 0, 500, VIRTUAL_WIDTH, 'center')
end
