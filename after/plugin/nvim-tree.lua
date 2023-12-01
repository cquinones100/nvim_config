local api = require "nvim-tree.api"

vim.keymap.set('n', '<C-n>', api.tree.toggle)

local DeleteCurrentFile = function ()
  local file = vim.fn.expand("%:p")

  vim.cmd("! rm " .. file)
end

vim.api.nvim_create_user_command("RemoveFile", DeleteCurrentFile, {
  desc = "rm the current file"
})

function CopyRelativeFilePath()
  local relative_file = vim.fn.expand("%")
  vim.fn.setreg("+", relative_file)
end

vim.api.nvim_create_user_command("CopyRelativeFilePath", CopyRelativeFilePath, {
  desc = "Copy relative path to file"
})

