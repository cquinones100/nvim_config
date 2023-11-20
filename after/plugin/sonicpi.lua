local CurrentFile = function ()
  local file = vim.fn.expand("%:p")

  return file
end

local RunCurrentFile = function ()
  vim.cmd.w()

  vim.cmd("!sonic-pi-tool.py run-file " .. CurrentFile())
end

vim.api.nvim_create_user_command("SonicPiPlay", RunCurrentFile, {
  desc = "Run current file in Sonic Pi"
})

vim.keymap.set("n", "<S-p>", RunCurrentFile)

local StopCurrentFile = function ()
  vim.cmd("!sonic-pi-tool.py stop")
end

vim.api.nvim_create_user_command("SonicPiStop", StopCurrentFile, {
  desc = "Stop current file in Sonic Pi"
})

vim.keymap.set("n", "<S-s>", StopCurrentFile)

vim.api.nvim_create_user_command("SonicPiStartServer", StopCurrentFile, {
  desc = "Stop current file in Sonic Pi"
})
