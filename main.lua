require('anim16')
function love.load()

    gun = anim16:new("example/",2)
    gun.x = 50
    gun.y = 50
    gun.speed = 10

    fId = 1
    cFrame = 1
end

function love.update(dt)

    gun:update()

    if love.mouse.isDown(1) then
        fId, cFrame =  gun:play(true, dt)
    end

end

function love.draw()

    gun:draw()
    love.graphics.print("Current Frame : "..fId, 50, 150)

end