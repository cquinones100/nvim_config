local get_window_size = function()
  local height = vim.fn.winheight(0)
  local width = vim.fn.winwidth(0)
  return height, width
end

local resizeHorizontally = function(amount)
  vim.cmd("vertical resize " .. amount)
end

local growHorizontally = function()
  local _, width = get_window_size()

  resizeHorizontally(width + 5)
end

local resizeVertically = function(amount)
  vim.cmd("resize " .. amount)
end

local growVertically = function()
  local height, _ = get_window_size()
  resizeVertically(height + 5)
end

vim.keymap.set("n", "<C-,>", growHorizontally)
vim.keymap.set("n", "<C-/>", growVertically)
