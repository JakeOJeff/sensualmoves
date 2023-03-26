local class = require("middleclass")
anim16 = class("anim")
local anim16s = {}
local lg = love.graphics

function anim16:initialize(position,frames,speed,x,y,rotation, sx, sy)
    self.position = position
    self.frames = frames
    self.speed = speed or 8

    self.x = x
    self.y = y
    self.r = rotation or 0
    self.sx = sx or 1
    self.sy = sy or 1

    self.table = {}
    for i = 1,self.frames,1 do
        self.table[i] = love.graphics.newImage(self.position..i..".png")
    end

    self.n = 1
    self.c = self.table[self.n]

    table.insert(anim16s, self)
	return self
end
function anim16:play(p, dt)
    local p = p or true
    if p then 
        if self.n < #self.table then
            self.n = self.n + self.speed * dt
            self.c = self.table[math.floor(self.n)]
        else
            self.n = 1
            self.c = self.table[self.n]
        end
    end
    return math.floor(self.n),self.c
    
end
function anim16:update(x, y, r, sx, sy)
    self.x = x
    self.y = y
    self.r = r
    self.sx = sx
    self.sy = sy
end

function anim16:draw()
    lg.draw(self.c, self.x, self.y,self.r,self.sx,self.sy) -- Making animation visible
end

