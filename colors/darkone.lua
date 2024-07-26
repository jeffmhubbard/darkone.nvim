for k in pairs(package.loaded) do
	if k:match(".*darkone.*") then
		package.loaded[k] = nil
	end
end

require("darkone").setup({})
require("darkone").colorscheme()
