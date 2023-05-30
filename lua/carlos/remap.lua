vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-s>", vim.cmd.w)

-- move highlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the middle when jumping up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- yank whole line shift+y
vim.keymap.set("n", "<S-y>", "yy")

_G.toggleTerminal = function()
  local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
  local terminalBufNr = vim.fn.bufnr('terminal')

  if buftype == 'terminal' then
    -- hide the terminal in a tab to avoid killing it

    -- move the terminal into a new tab
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>T', true, true, true), 'n', true)

    -- go to the last visited tab
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('g<tab>', true, true, true), 'n', true)
  else
    _G.has_toggled_terminal = true

    -- create a split pane below
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>s', true, true, true), 'n', true)

    -- move to the new pane
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>j', true, true, true), 'n', true)

    -- open the terminal
    vim.api.nvim_feedkeys(':te', 'n', false)

    -- carriage return the previous command
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
  end
end

-- toggle terminal
vim.keymap.set("n", "<C-t>", ":lua toggleTerminal()<CR>")

