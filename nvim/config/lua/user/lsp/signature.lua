local ok, signature = pcall(require, "lsp_signature")
if not ok then
	vim.notify("could not load lsp_signature")
	return
end

signature.setup({
	floating_window = true,
	hint_prefix = "",
	bind = true,
	handler_opts = {
		border = "rounded",
	},
})
