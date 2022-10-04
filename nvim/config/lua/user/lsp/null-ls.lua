local nulls_ok, null_ls = pcall(require, "null-ls")
if not nulls_ok then
	vim.notify("could not load null_ls")
	return
end

null_ls.setup({
	sources = {
		-- null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.stylua,
	},
	capabilities = require("user.lsp.handlers").capabilities,
	on_attach = function(client, bufnr)
		-- lspstatus.on_attach(client, bufnr)
		if client.server_capabilities.document_formatting then
			vim.cmd([[
				augroup LspFormatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
				augroup END
			]])
		end
	end,
})
