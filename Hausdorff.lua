local Hausdorff = {}

Hausdorff.getDistance = function(A, B)
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

return Hausdorff
