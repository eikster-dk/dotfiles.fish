local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		side = "left",
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})

local r = require("user.remap").nnoremap

r("<leader>e", ":NvimTreeToggle<cr>")
r("<leader>ef", ":NvimTreeFocus<cr>")
