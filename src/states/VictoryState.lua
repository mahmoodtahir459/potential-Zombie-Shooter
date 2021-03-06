VictoryState = Class{__includes = BaseState}

function VictoryState:enter(params)
    self.level = params.level
    self.player = params.player
    self.score = params.score
end
function VictoryState:update()
    if love.keyboard.wasPressed("escape") then
        love.event.quit()
      end
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play', {
            level = self.level,
            player = self.player,
            score = self.score
        })
    end
end

function VictoryState:render()
    self.player:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf("Level Cleared", 0, VIRTUAL_HEIGHT / 3, VIRTUAL_WIDTH, 'center')
    love.graphics.printf("Press Enter to Start Next Level", 0, 500, VIRTUAL_WIDTH, 'center')
end
