local class_mt = {}
local object_mt = {}
local object_idx = {}
local Vector = setmetatable({}, class_mt)

object_mt.__index = object_idx

function class_mt.__call(class, ...)
	return class.new(...)
end

Vector.hd = function(A, B)
	local h = {}

	for i,a in ipairs(A) do
		for j,b in ipairs(B) do
			if j == 1 then
				h[i] = #(a-b)
			else
				h[i] = math.min(#(a-b), h[i])
			end
		end
	end

	return math.max(unpack(h))
end

----------------------------------------[[
--	Operators
----------------------------------------]]
function object_mt.__tostring(object)
	local fiber = {}

	table.insert(fiber, "[")

	for i,v in ipairs(object._vector) do
		table.insert(fiber, v)
		if i < #object._vector then table.insert(fiber, ", ") end
	end

	table.insert(fiber, "]")

	return table.concat(fiber)
end
function object_mt.__len(object)
	-- Magnitude of the vector rather than number of dimensions; for that see :dim()
	local magnitude = 0

	for i, v in ipairs(object._vector) do
		magnitude = magnitude + v^2
	end

	return math.sqrt(magnitude)
end
function object_mt.__eq(left, right)
	if #left._vector ~= #right._vector then
		return false
	end
	
	for i = 1,#left do
		if left._vector[i] ~= right._vector[i] then
			return false
		end
	end

	return true
end
function object_mt.__add(left, right)
	if #left._vector ~= #right._vector then
		return nil
	end

	local v = Vector(left)

	for i = 1, #left._vector do
		v._vector[i] = v._vector[i] + right._vector[i]
	end

	return v
end
function object_mt.__sub(left, right)
	if #left._vector ~= #right._vector then
		return nil
	end

	local v = Vector(left)

	for i, c in ipairs(v._vector) do
		v._vector[i] = c - right._vector[i]
	end

	return v
end
function object_mt.__mul(left, right)
	-- Dot Product
	if #left._vector ~= #right._vector then
		return nil
	end

	local dot = 0

	for i, v in ipairs(left._vector) do
		dot = dot + v * right._vector[i]
	end

	return dot
end
function object_mt.__div(left, right)
	error("Implement this function")
end
function object_mt.__unm(object)
	local v = Vector(object)
	for i = 1, #object._vector do
		v._vector[i] = -v._vector[i]
	end

	return v
end

function object_idx:dim()
	return #self._vector
end
function object_idx:euclideanDistance(v2)
	local m = #(self - v2)

	if m < 0 then
		return -m
	else 
		return m
	end
end

function Vector.new(...)
	-- requires Vector or unpacked array for input
	local self = {}

	self._vector = {}

	if type(...) == "table" then
		local input = (...)._vector or (...)
		for i,value in ipairs(input) do
			table.insert(self._vector, value)
		end
	else
		self._vector = {...}
	end
	self._size = #self._vector

	setmetatable(self, object_mt)

	return self
end

return Vector






