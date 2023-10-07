vim.opt.shell = "/bin/zsh"

require("carlos.lazy")
require("carlos.remap")

vim.cmd('colorscheme rose-pine')

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "ruby", "javascript", "typescript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 16
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.nu = true
vim.opt.updatetime = 50

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.clipboard = "unnamed"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true
