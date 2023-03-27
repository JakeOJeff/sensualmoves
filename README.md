# Sensual Moves / anim16

### A simple quickie animation tool for  [LÖVE](https://love2d.org/), So simple even grandma Alice can edit it!

This is a simple animation class I wrote for my personal game.

**NOTE : Not for *SPRITESHEET* Animations**

## How to Install 

```lua
local anim16 = require('anim16')
```

## Parameters

#### Animation Arguments

| Argument | Function | Default |
| --- | --- | --- |
| `position` | File location of the Frames | **nil** |
| `frames` | Number of frames in the Animation | **nil** | 
| `speed` | Speed of the Animation ( Frames/Second ) | **nil** |

#### Frame Data points

| Argument | Function | Default |
| --- | --- | --- |
| `n` | Frame ID ( ID of Currently Playing Frame ) | **1** |
| `c` | Current Frame ( Image of Currently Playing Frame | **nil** | 

#### Image Arguments

| Argument | Function | Default |
| --- | --- | --- |
| `x` | X Coordinate | **0** |
| `y` | Y Coordinate | **0** | 
| `r` | Image rotation | **0** |
| `sx` | Scale X | **1** |
| `sy` | Scale Y | **1** | 


## [License](LICENSE) 🔖

See [LICENSE](LICENSE) file for more information.

## Acknowledgments 🙏

Contains [middleclass](https://github.com/kikito/middleclass)

Made with [LÖVE](https://love2d.org/)

## Get Started

Install the library
```lua

local anim16 = require('anim16')

```

Define a new Object Animation, define the animation's position and number of frames

```lua
function love.load()
    chicken= anim16:new("example/",7) -- Defining a new Object 'chicken' 
    -- Properties
    chicken.x = 50 
    chicken.y = 50
    chicken.speed = 10
end
```

Update the Animation  ` *Only necessary if values change constantly | eg : chicken:update(character.x, character.y)* ` , and also add an event to start/play the animation

```lua
function love.update(dt)
    chicken:update() -- Animation update
    chicken:play(true, dt)
end

```

Draw the Animation

```lua
function love.draw()
    chicken:draw() -- Drawing the animation
end
```

# Sample Example

`main.lua`
```lua
local anim16 = require('anim16')
function love.load()
    chicken = anim16:new("example/",7) -- Defining a new Object 'chicken' 
    -- Properties
    chicken.x = 600 
    chicken.y = 50
    chicken.speed = 60

    fId = 1 -- Frame ID
    cImg = 1 -- Current Image
end

function love.update(dt)
    if love.keyboard.isDown("space") then -- Mouse Event to play animation
        fId, cImg =  chicken:play(true, dt)
        if fId ~= 1 then -- Checking if Current Frame is not equal to one
            local walk = chicken.x - 2 -- Determining Chicken walking
            chicken:update(walk, 50) -- Updating chicken's X coordinate
        end
    end
end

function love.draw()
    chicken:draw() -- Drawing the animation
    love.graphics.print("Current Frame : "..fId, 0, 0) -- Getting current frame
end
```

`Output`
![](https://github.com/JakeOJeff/sensualmoves/blob/main/anim16example.gif)
