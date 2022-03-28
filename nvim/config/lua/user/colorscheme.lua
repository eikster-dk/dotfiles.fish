local ok, _ = pcall(require, "dracula")
if not ok then
	return
end

vim.cmd([[
colorscheme dracula
]])
