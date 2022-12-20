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
    use("github/copilot.vim")  -- pretty funny to use
    --
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
    use('nvim-treesitter/playground')

    use('mbbill/undotree')
    use('tpope/vim-fugitive')
end)
