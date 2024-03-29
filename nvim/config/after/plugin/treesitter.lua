
local configs_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"fish",
		"go",
		"gomod",
		"gowork",
		"graphql",
		"hcl",
		"html",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"markdown_inline",
		"rust",
		"scss",
		"sql",
		"svelte",
		"toml",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "html" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "yaml" } },
})
