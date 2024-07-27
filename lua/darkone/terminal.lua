local v = vim
local M = {}
local cfg = v.g.darkone_config
local c = require("darkone.colors")

function M.setup()
	if not cfg.term_colors then
		return
	end
	v.g.terminal_color_0 = c.black
	v.g.terminal_color_1 = c.dark_red
	v.g.terminal_color_2 = c.dark_green
	v.g.terminal_color_3 = c.dark_yellow
	v.g.terminal_color_4 = c.dark_blue
	v.g.terminal_color_5 = c.dark_magenta
	v.g.terminal_color_6 = c.dark_cyan
	v.g.terminal_color_7 = c.grey
	v.g.terminal_color_8 = c.dark_grey
	v.g.terminal_color_9 = c.red
	v.g.terminal_color_10 = c.green
	v.g.terminal_color_11 = c.yellow
	v.g.terminal_color_12 = c.blue
	v.g.terminal_color_13 = c.magenta
	v.g.terminal_color_14 = c.cyan
	v.g.terminal_color_15 = c.white
end

return M
