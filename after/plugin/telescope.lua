local builtin = require('telescope.builtin')

local function getFindFiles()
  local full_path = 'nvim/telescope.lua'
  local file = io.open(full_path, "r")

  local findFiles

  if file then
    local custom = require('nvim.telescope')

    findFiles = custom.findFiles
  else
    findFiles = function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
        file_ignore_patterns = { ".git", "node_modules", "vendor", "tmp" },
      })
    end
  end

  return findFiles
end

vim.keymap.set('n', '<c-p>', getFindFiles(), {})

require("telescope").load_extension("dir")

vim.keymap.set('n', '<S-c-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<S-c-f>d", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<S-c-p>", builtin.commands, {})

vim.api.nvim_create_user_command("GitLog", ":Telescope git_commits", {
  desc = "Run Git Log using Telescope"
})

vim.api.nvim_create_user_command("GitLogFile", ":Telescope git_bcommits", {
  desc = "Run Git Log on current file using Telescope"
})

vim.api.nvim_create_user_command("GitStash", ":Telescope git_stash", {
  desc = "Run Git Stash using Telescope"
})

vim.api.nvim_create_user_command("GitBranch", ":Telescope git_branches", {
  desc = "Run Git Branch using Telescope"
})

vim.api.nvim_create_user_command("CommandHistory", ":Telescope command_history", {
  desc = "Get command history using Telescope"
})
