local M = {}

function M.dim_color(hex, factor)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	r = math.floor(r * factor)
	g = math.floor(g * factor)
	b = math.floor(b * factor)
	return string.format("#%02x%02x%02x", r, g, b)
end

function M.desaturate_color(hex, factor)
	hex = hex:gsub("#", "")
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	local gray = (r + g + b) / 3
	r = math.floor(r + (gray - r) * factor)
	g = math.floor(g + (gray - g) * factor)
	b = math.floor(b + (gray - b) * factor)
	return string.format("#%02x%02x%02x", r, g, b)
end

function M.unique_by_field(tbl, field)
	local seen = {}
	local result = {}
	for _, item in ipairs(tbl) do
		local value = item[field]
		if not seen[value] then
			seen[value] = true
			table.insert(result, item)
		end
	end
	return result
end

return M
