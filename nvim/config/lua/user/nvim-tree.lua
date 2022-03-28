local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		side = "left",
	},
})

local r = require("user.remap").nnoremap

r("<leader>e", ":NvimTreeToggle<cr>")
r("<leader>ef", ":NvimTreeFocus<cr>")
