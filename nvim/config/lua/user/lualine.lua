local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("could not load lualine")
	return
end

lualine.setup({
	options = {
		theme = "dracula",
	},
})
