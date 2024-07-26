local M = {}
local cfg = vim.g.darkone_config
local c = require("darkone.colors")

function M.setup()
	if not cfg.term_colors then
		return
	end
	vim.g.terminal_color_0 = c.black
	vim.g.terminal_color_1 = c.dark_red
	vim.g.terminal_color_2 = c.dark_green
	vim.g.terminal_color_3 = c.dark_yellow
	vim.g.terminal_color_4 = c.dark_blue
	vim.g.terminal_color_5 = c.dark_magenta
	vim.g.terminal_color_6 = c.dark_cyan
	vim.g.terminal_color_7 = c.grey
	vim.g.terminal_color_8 = c.dark_grey
	vim.g.terminal_color_9 = c.red
	vim.g.terminal_color_10 = c.green
	vim.g.terminal_color_11 = c.yellow
	vim.g.terminal_color_12 = c.blue
	vim.g.terminal_color_13 = c.magenta
	vim.g.terminal_color_14 = c.cyan
	vim.g.terminal_color_15 = c.white
end

return M
