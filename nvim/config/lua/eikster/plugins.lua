local fn = vim.fn

-- Bootstrap packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--  augroup packer_user_config
--   autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
-- ]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- bootstrap plugins
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Package manager

    use("ThePrimeagen/vim-be-good")

    -- ui/ux
    use({
        "catppuccin/nvim",
        as = "catppuccin",
    })
    use({ "ThePrimeagen/harpoon" })

    -- LSP stuff made simple with lsp-zero:
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    use("folke/zen-mode.nvim")
    use("github/copilot.vim") -- use("lewis6991/impatient.nvim")
    -- use("kyazdani42/nvim-web-devicons")
    -- use("kyazdani42/nvim-tree.lua")
    -- use("nvim-lualine/lualine.nvim")
    -- use("folke/which-key.nvim")
    --lsp, cmp & snippets
    -- use({
    -- 	"williamboman/mason.nvim",
    -- 	requires = {
    -- 		-- lsp
    -- 		"williamboman/mason-lspconfig.nvim",
    -- 		"onsails/lspkind-nvim",
    -- 		"neovim/nvim-lspconfig",
    -- 		"jose-elias-alvarez/null-ls.nvim",
    -- 		"nvim-lua/lsp-status.nvim",
    -- 		"ray-x/lsp_signature.nvim",
    --
    -- 		-- cmp
    -- 		"hrsh7th/nvim-cmp",
    -- 		"hrsh7th/cmp-buffer",
    -- 		"hrsh7th/cmp-path",
    -- 		"hrsh7th/cmp-cmdline",
    -- 		"hrsh7th/cmp-emoji",
    -- 		"hrsh7th/cmp-calc",
    -- 		"windwp/nvim-autopairs",
    --
    -- 		-- cmp & lsp
    -- 		"hrsh7th/cmp-nvim-lsp",
    -- 		"hrsh7th/cmp-nvim-lsp-signature-help",
    -- 		"numToStr/Comment.nvim",
    --
    -- 		-- hints
    -- 		"simrat39/inlay-hints.nvim",
    --
    -- 		-- snippets
    -- 		-- todo: figure out which snippet tool I want to use
    -- 		"L3MON4D3/LuaSnip",
    -- 		"rafamadriz/friendly-snippets",
    -- 	},
    -- 	config = function()
    -- 		require("lspkind").init()
    -- 		require("user.autopairs")
    -- 		require("user.lsp")
    -- 		require("user.cmp")
    -- 	end,
    -- })
    -- debug
    -- use({
    -- 	"mfussenegger/nvim-dap",
    -- 	config = function()
    -- 		require("user.debug")
    -- 	end,
    -- 	requires = {
    -- 		"leoluz/nvim-dap-go",
    -- 		"rcarriga/nvim-dap-ui",
    -- 		"theHamsta/nvim-dap-virtual-text",
    -- 	},
    -- })

    -- trouble
    -- use({
    -- 	"folke/trouble.nvim",
    -- 	config = function()
    -- 		require("user.trouble")
    -- 	end,
    -- })

    -- snippets

    -- telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-github.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
    })

    -- treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })

    -- git
    -- use("TimUntersberger/neogit")
    -- use({
    -- 	"lewis6991/gitsigns.nvim",
    -- 	config = function()
    -- 		require("user.gitsigns")
    -- 	end,
    -- })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
