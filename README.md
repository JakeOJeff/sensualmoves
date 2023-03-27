# Sensual Moves / anim16

### A simple quickie animation tool for  [LÖVE](https://love2d.org/), So simple even grandma Alice can edit it!

This is a simple animation class I wrote for my personal game.

**NOTE : Not for *SPRITESHEET* Animations**

## How to Install 

```lua
require('anim16')
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

require('anim16')

```

Define a new Object Animation, define the animation's position and number of frames

```lua
function love.load()
    gun = anim16:new("example/",2) -- Defining a new Object 'Gun' 
    -- Properties
    gun.x = 50 
    gun.y = 50
    gun.speed = 10

    fId = 1 -- Frame ID
    cImg = 1 -- Current Image
end
```

Update the Animation  ` *Only necessary if values change constantly | eg :  gun:update(character.x, character.y)* ` , and also add an event to start/play the animation

```lua
function love.update(dt)
    gun:update() -- Animation update
   
    if love.mouse.isDown(1) then -- Mouse Event to play animation
        fId, cImg =  gun:play(true, dt)
    end
end

```

Draw the Animation

```lua
function love.draw()
    gun:draw() -- Drawing the animation
    
    love.graphics.print("Current Frame : "..fId, 50, 150) -- Getting current frame
end
```
