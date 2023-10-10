local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>',
  function()
    builtin.find_files({
      hidden = true,
      file_ignore_patterns = {'.git/*', 'node_modules/*', 'vendor/*'},
      no_ignore = true,
    })
  end
)

vim.keymap.set('n', '<S-c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<C-s>", vim.cmd.w)
