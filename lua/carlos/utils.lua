local function get_terminal_buffer_id()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
      return buf
    end
  end

  return nil
end

function RunInTerminal(cb)
  if not get_terminal_buffer_id() then
    vim.api.nvim_command('vsplit')
    local win_ids = vim.api.nvim_list_wins()
    local new_split_id = win_ids[#win_ids]
    vim.api.nvim_set_current_win(new_split_id)
    vim.api.nvim_command('term')

    if not get_terminal_buffer_id() then
      print("Could not create terminal")

      return
    end
  end

  print(get_terminal_buffer_id())

  local chan_id = vim.api.nvim_buf_get_option(get_terminal_buffer_id(), 'channel')

  return cb(function (cmd)
    print("sending this command to the terminal: " .. cmd)

    vim.fn.chansend(chan_id, cmd .. "\n")
  end)
end

function TestInTerminal()
  RunInTerminal(function (send)
    print("hello")

    send("ls -la")
  end)
end

vim.api.nvim_create_user_command("TestInTerminal", TestInTerminal, {
  desc = "Testing"
})

return {
  RunInTerminal = RunInTerminal,
}


