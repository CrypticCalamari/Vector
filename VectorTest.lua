local V = require("Vector")

local v1 = V(1, 2, 3, 4, 5)
local v2 = V(1, 2)
local v3 = V({5, 4, 3, 2, 1})
local A = {V(3), V(6), V(20)}
local B = {V(3), V(6), V(-3)}

print(V.hd(A, B))
print(v1)
print("v1: "..tostring(v1))
print("v2: "..tostring(v2))
print("v3: "..tostring(v3))
print("v1 + v3: "..tostring((v1 + v3)))
print("v1 - v3: "..tostring((v1 - v3)))
print("v1 * v3: "..tostring((v1 * v3)))
print("-v1: "..tostring(-v1))
print("v1:dim(): "..v1:dim())
