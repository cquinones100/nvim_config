local builtin = require('telescope.builtin')

local function findDirectory(startDir, targetName)
  local full_path = startDir .. targetName
  local file = io.open(full_path, "r")

  local findFiles

  if file then
    local custom = require('project_configs.' .. targetName .. '.telescope')

    findFiles = custom.findFiles
  else
    findFiles = function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
      })
    end
  end

  return findFiles
end

local directory_functions = require('carlos.find_directory')

local current_directory = directory_functions.getLastPathComponent(vim.fn.getcwd())

local project_configs_directory = vim.fn.stdpath("config") .. "/lua/project_configs/"

findDirectory(project_configs_directory, current_directory)

vim.keymap.set('n', '<c-p>', findDirectory(project_configs_directory, current_directory), {})

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
