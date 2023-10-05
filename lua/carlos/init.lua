require("carlos.lazy")
require("carlos.remap")

-- lsp_zero configuration

local lsp_zero = require("lsp-zero")

require('mason').setup({
  log_level = vim.log.levels.DEBUG
})

require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'tsserver', 'rust_analyzer', "eslint", "lua_ls", "solargraph" },

  handlers = {
    lsp_zero.default_setup,
    ['lua_ls'] = function ()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
    end,
    ['solargraph'] = function ()
      local lspconfig = require("lspconfig")

      lspconfig.solargraph.setup {
        settings = {
        }
      }
    end,
    -- ['tsserver'] = function ()
    --   local lspconfig = require("lspconfig")

    --   lspconfig.tsserver.setup {
    --     filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" }
    --   }
    -- end
  },
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

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

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

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

vim.opt.statusline = "%n"

vim.opt.statusline = "%F:%l"

vim.opt.clipboard = "unnamed"

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

