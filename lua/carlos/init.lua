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

vim.opt.termguicolors = true

vim.opt.colorcolumn = "80"

vim.opt.statusline = "%n"

local nvim_lsp = require('lspconfig')
local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true
  }
  )
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

nvim_lsp.solargraph.setup {
  cmd = {
    "bundle",
    "exec",
    "solargraph",
    "stdio"
  },
  filetypes = {
    "ruby"
  },
  flags = {
    debounce_text_changes = 150
  },
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true
    }
  }
}
