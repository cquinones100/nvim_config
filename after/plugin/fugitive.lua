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

vim.api.nvim_create_user_command("GitForcePush", "Git push origin head -f", {
  desc = "Git force push"
})

local GithubPrCreate = function ()
  local latest_comment = vim.fn.system("git show-branch --no-name HEAD | head -n 1")

  vim.fn.system("gh pr create --title \"" .. latest_comment .. "\"")
  vim.fn.system("gh pr view --web")
end

vim.api.nvim_create_user_command("GithubPrCreate", GithubPrCreate, {
  desc = "Create a Github PR"
})

vim.api.nvim_create_user_command("GithubPrView", "! gh pr view --web", {
  desc = "View Github PR in browser"
})
