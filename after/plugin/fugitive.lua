vim.api.nvim_create_user_command("GitStatus", ":Git", {
  desc = "Run Git Status using Vim Fugitive"
})

local GitCheckoutCurrentFile = function ()
  local file = vim.fn.expand("%:p")

  vim.cmd(":Git checkout main " .. file)

  print("checked out main " .. file)
end

vim.api.nvim_create_user_command("GitCheckoutCurrentFile", GitCheckoutCurrentFile, {
  desc = "Git Checkout Current File to Main's Version"
})

local GitLogCurrentFile = function ()
  local file = vim.fn.expand("%:p")

  vim.cmd(":Git log " .. file)
end

vim.api.nvim_create_user_command("GitLogCurrentFile", GitLogCurrentFile, {
  desc = "Git Checkout Current File to Main's Version"
})
