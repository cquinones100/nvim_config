vim.opt.shell = "/bin/zsh"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("carlos.lazy")
require("nvim-tree").setup({
  git = {
    enable = true,
    ignore = false
  },
})
require('nvim-web-devicons').setup()
require("carlos.remap")
require("carlos.utils")

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

local CloseAllButCurrentBuffer = function()
  vim.cmd(":bufdo! bdelete | bnext")
end

vim.api.nvim_create_user_command("CloseAllButCurrentBuffer", CloseAllButCurrentBuffer, {
  desc = "Close all buffers except the current one"
})

local SorbetToQuickFix = function(arg)
  local filter  = arg.args

  print("the filter: " .. filter)

  vim.cmd("! bundle exec srb tc 2>&1 | grep -E \"\\.rb:\" awk -F: '{print $1\":\"$2\":1: \"$3}' | sed -e 's/^[ \t]*//' > ~/.config/nvim/quickfix.txt")

  print("the filter length: " .. string.len(filter))

  if string.len(filter) > 0 then
    vim.cmd("! cat ~/.config/nvim/quickfix.txt | grep " .. filter .. " > ~/.config/nvim/quickfix.txt")
  end

  vim.cmd(":cfile ~/.config/nvim/quickfix.txt")
  vim.cmd(":copen")
end

vim.api.nvim_create_user_command("SorbetToQuickFix", SorbetToQuickFix, {
  desc = "Run Sorbet and send errors to quickfix",
  nargs = "*"
})
