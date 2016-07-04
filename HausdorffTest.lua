local V = require("Vector")
local H = require("Hausdorff")

space1 = {V(1,2), V(50,40), V(3, 3)}
space2 = {V(1,2), V(5,5), V(100, 100)}

print(H.getDistance(space1, space2))
