local function findDirectory(startDir, targetName)
  print("Searching for " .. targetName .. " in " .. startDir)
  -- local dirEntries = vim.loop.fs_scandir(startDir)
  -- if not dirEntries then
  --   return nil  -- Directory not found
  -- end

  -- for entry in dirEntries do
  --   if entry.type == "directory" then
  --     if entry.name == targetName then
  --       return vim.fn.fnamemodify(vim.fn.fnamemodify(entry.path, ":p"), ":h")
  --     else
  --       local subDir = findDirectory(entry.path, targetName)
  --       if subDir then
  --           return subDir
  --       end
  --     end
  --   end
  -- end

  -- return nil  -- Directory not found
end

local function getLastPathComponent(inputString)
  -- Use string.match to capture the last part of the string after the last "/"
  local lastPathComponent = string.match(inputString, "[^/]*$")

  return lastPathComponent
end

return {
  findDirectory = findDirectory,
  getLastPathComponent = getLastPathComponent,
}
