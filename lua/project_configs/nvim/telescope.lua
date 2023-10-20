local builtin = require('telescope.builtin')

local module = {}

module.findFiles = function()
  builtin.git_files({
    hidden = true,
    no_ignore = true,
  })
end

return module

