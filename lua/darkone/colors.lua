local v = vim
local colors = require("darkone.palette")

local function select_colors()
	local selected = { none = "none" }
	selected = v.tbl_extend("force", selected, colors[v.g.darkone_config.style])
	selected = v.tbl_extend("force", selected, v.g.darkone_config.colors)
	return selected
end

return select_colors()
