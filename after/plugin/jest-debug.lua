function RunJestDebugCurrentFile()
  local relative_file = vim.fn.expand("%")

  -- Create a new vertical split
  vim.api.nvim_command('vsplit')

  -- Get the window IDs
  local win_ids = vim.api.nvim_list_wins()

  -- The ID of the new split should be the last one in the list
  local new_split_id = win_ids[#win_ids]

  -- Move to the new split
  vim.api.nvim_set_current_win(new_split_id)

  vim.api.nvim_command('term')


  local cmd = 'npx ndb ./node_modules/jest/bin/jest.js ' .. relative_file .. ' --watch --runInBand --colors --verbose'

  -- Get the job ID of the terminal
  local job_id = vim.api.nvim_buf_get_var(0, 'terminal_job_id')

  -- Send the command to the terminal
  vim.fn.chansend(job_id, cmd .. "\n")
end

vim.api.nvim_create_user_command("JestRunCurrentFile", RunJestDebugCurrentFile, {
  desc = "Run Jest and a Debugger in watch mode"
})
