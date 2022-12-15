local harpoon = require("harpoon")

local r = require("eikster.remap").nnoremap

harpoon.setup({})

require("telescope").load_extension("harpoon")

r("<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<CR>")
r("<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
r("<leader>h", "<cmd>lua require('harpoon.ui').nav_file(vim.v.count1)<CR>")

r("<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
r("<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
r("<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
r("<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
