local RunInTerminal = require('carlos.utils').RunInTerminal

function RunJestDebugCurrentFile()
  local relative_file = vim.fn.expand("%")

  local cmd = 'npx ndb ./node_modules/jest/bin/jest.js ' .. relative_file .. ' --runInBand --colors --verbose'

  RunInTerminal(function (send)
    send(cmd)
  end)
end

vim.api.nvim_create_user_command("JestDebugCurrentFile", RunJestDebugCurrentFile, {
  desc = "Run Jest and a Debugger in watch mode"
})

