local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup({
    defaults = require("telescope.themes").get_dropdown({}),
})

local actions = require("telescope.actions")

telescope.setup({})
telescope.load_extension("fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

