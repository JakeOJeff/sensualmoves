# Sensual Moves / anim16

### A simple quickie animation tool for  [LÖVE](https://love2d.org/), So simple even grandma Alice can edit it!

This is a simple animation class I wrote for my personal game.

**NOTE : Not for *SPRITESHEET* Animations**

## How to Install 

```lua
require('anim16')
```



## [License](LICENSE) 🔖

See [LICENSE](LICENSE) file for more information.

## Acknowledgments 🙏

Contains [middleclass](https://github.com/kikito/middleclass)

External Libraries : ZAM Lib

Made with [LÖVE](https://love2d.org/)

## Get Started

```lua

require('anim16')
function love.load()

    gun = anim16:new("example/",2) -- Defining a new Object 'Gun' 
    -- Properties
    gun.x = 50 
    gun.y = 50
    gun.speed = 10

    fId = 1 -- Frame ID
    cImg = 1 -- Current Image
end

function love.update(dt)

    gun:update() -- Animation update [ Only necessary if values change constantly | eg :  gun:update(character.x, character.y) ]

    if love.mouse.isDown(1) then -- Mouse Event to play animation
        fId, cImg =  gun:play(true, dt)
    end

end

function love.draw()

    gun:draw() -- Drawing the animation

    love.graphics.print("Current Frame : "..fId, 50, 150) -- Getting current frame

end
```
