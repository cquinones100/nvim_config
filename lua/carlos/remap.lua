vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jumping up or down
vim.keymap.set("n", "<c-d>", "<C-d>zz")
vim.keymap.set("n", "<c-u>", "<C-u>zz")

-- yank whole line shift+y
vim.keymap.set("n", "<S-y>", "yy")

-- harpoon keybindings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

--buffer_manager keybindings
local buffer_manager = require('buffer_manager.ui')

vim.keymap.set("n", "<c-b>", function ()
  buffer_manager.toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<c-e>", ui.toggle_quick_menu)

--undotree remap
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("i", "<C-c>", "<Esc>")

-- replace currently hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- copy file path to clipboard
vim.keymap.set("n", "<S-c-c>", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end)

-- open terminal in horizontal split
vim.keymap.set("n", "<c-t>", function() vim.cmd("sp | resize 10 | term") end)
