vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<S-c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- move highlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yank whole line shift+y
vim.keymap.set("n", "<S-y>", "yy")

-- harpoon keybindings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<c-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<c-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<c-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<c-n>", function() ui.nav_file(3) end)

--undotree remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace currently hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
