local api = require "nvim-tree.api"

vim.keymap.set('n', '<C-n>', api.tree.toggle)
