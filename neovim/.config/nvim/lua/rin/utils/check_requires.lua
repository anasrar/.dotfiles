local M = {}

---@param paths string[] Paths to module
---@return boolean
M.check = function(paths)
  for _, path in pairs(paths) do
    local ok, _ = pcall(require, path)
    if not ok then
      vim.notify("[CHECK REQUIRE FAILED] " .. path .. " " .. debug.getinfo(2).source, vim.log.levels.WARN)
      return false
    end
  end
  return true
end

return M
