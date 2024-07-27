local v = vim
local M = {}

M.styles_list = { "darkest" }

---Change darkone option (v.g.darkone_config.option)
---It can't be changed directly by modifying that field due to a Neovim lua bug with global variables (darkone_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
	local cfg = v.g.darkone_config
	cfg[opt] = value
	v.g.darkone_config = cfg
end

---Apply the colorscheme (same as ':colorscheme darkone')
function M.colorscheme()
	v.cmd("hi clear")
	if v.fn.exists("syntax_on") then
		v.cmd("syntax reset")
	end
	v.o.termguicolors = true
	v.g.colors_name = "darkone"
	--if v.o.background == "light" then
	--	M.set_options("style", "light")
	--elseif v.g.darkone_config.style == "light" then
	--	M.set_options("style", "light")
	--end
	require("darkone.highlights").setup()
	require("darkone.terminal").setup()
end

---Toggle between darkone styles
function M.toggle()
	local index = v.g.darkone_config.toggle_style_index + 1
	if index > #v.g.darkone_config.toggle_style_list then
		index = 1
	end
	M.set_options("style", v.g.darkone_config.toggle_style_list[index])
	M.set_options("toggle_style_index", index)
	--if v.g.darkone_config.style == "light" then
	--	v.o.background = "light"
	--else
	v.o.background = "dark"
	--end
	v.api.nvim_command("colorscheme darkone")
end

local default_config = {
	-- Main options --
	style = "darkest", -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
	toggle_style_key = nil,
	toggle_style_list = M.styles_list,
	transparent = true, -- don't set background
	term_colors = true, -- if true enable the terminal
	ending_tildes = false, -- show the end-of-buffer tildes
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- Changing Formats --
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- center bar (c) transparency
	},

	-- Custom Highlights --
	colors = {}, -- Override default colors
	highlights = {}, -- Override highlight groups

	-- Plugins Related --
	diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true, -- use undercurl for diagnostics
		background = true, -- use background color for virtual text
	},
}

---Setup darkone.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
	if not v.g.darkone_config or not v.g.darkone_config.loaded then -- if it's the first time setup() is called
		v.g.darkone_config = v.tbl_deep_extend("keep", v.g.darkone_config or {}, default_config)
		M.set_options("loaded", true)
		M.set_options("toggle_style_index", 0)
	end
	if opts then
		v.g.darkone_config = v.tbl_deep_extend("force", v.g.darkone_config, opts)
		if opts.toggle_style_list then -- this table cannot be extended, it has to be replaced
			M.set_options("toggle_style_list", opts.toggle_style_list)
		end
	end
	if v.g.darkone_config.toggle_style_key then
		v.api.nvim_set_keymap(
			"n",
			v.g.darkone_config.toggle_style_key,
			'<cmd>lua require("darkone").toggle()<cr>',
			{ noremap = true, silent = true }
		)
	end
end

function M.load()
	v.api.nvim_command("colorscheme darkone")
end

return M
