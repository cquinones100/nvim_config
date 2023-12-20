function RubocopCurrentFile ()
  local relative_file = vim.fn.expand("%")

  print("Running Rubocop on " .. relative_file)

  vim.cmd("! bundle exec rubocop -a " .. relative_file)
end

vim.api.nvim_create_user_command("RubocopCurrentFile", RubocopCurrentFile, {
  desc = "Run Rubocop on the current file"
})

function RSpecCurrentFile ()
  local relative_file = vim.fn.expand("%")
  print("Running RSpec on " .. relative_file)

  vim.cmd("! bundle exec rspec " .. relative_file)
end

vim.api.nvim_create_user_command("RSpecCurrentFile", RSpecCurrentFile, {
  desc = "Run RSpec on the current file"
})

