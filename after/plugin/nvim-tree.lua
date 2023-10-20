local api = require "nvim-tree.api"

vim.keymap.set('n', '<c-n>', api.tree.toggle, { noremap = true, silent = true })
