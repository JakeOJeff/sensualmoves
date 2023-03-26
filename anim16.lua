local class = require("middleclass")
anim16 = class("anim")
local anim16s = {}
local lg = love.graphics

-- ==================================================================
-- Animation Initialization
function anim16:initialize(position,frames,speed,x,y,rotation, sx, sy)

    -- Declaring Position, Frames, Speed
    self.position = position -- Location of the image
    self.frames = frames -- Max frames
    self.speed = speed or 8 -- Speed of the Animation / cFrame switching speed

    -- Image arguments
    self.x = x 
    self.y = y
    self.r = rotation or 0
    self.sx = sx or 1
    self.sy = sy or 1

    -- Loading the Image
    self.table = {}
    for i = 1,self.frames,1 do
        self.table[i] = love.graphics.newImage(self.position..i..".png") -- Loading based on the number of each frame
    end

    self.n = 1 -- Frame ID
    self.c = self.table[self.n] -- Frame Image

    table.insert(anim16s, self)
	return self
end

-- ==================================================================
-- Switching cFrames
function anim16:play(p, dt)
    local p = p or true -- Enabling
    if p then 
        if self.n < #self.table then
            self.n = self.n + self.speed * dt
            self.c = self.table[math.floor(self.n)]
        else
            self.n = 1
            self.c = self.table[self.n]
        end
    end
    return math.floor(self.n),self.c -- Returning ID & Image
    
end

-- ==================================================================
-- Updating animations on Image types
function anim16:update(x, y, r, sx, sy)
    -- Updating Image Arguments [ If any ] 
    self.x = x
    self.y = y
    self.r = r
    self.sx = sx
    self.sy = sy
end

-- ==================================================================
-- Drawing the Image
function anim16:draw()
    lg.draw(self.c, self.x, self.y,self.r,self.sx,self.sy) -- Making animation visible
end

