vim.api.nvim_create_user_command("GitStatus", ":Git", {
  desc = "Run Git Status using Vim Fugitive"
})
