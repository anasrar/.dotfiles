local safe_require = function(path)
  local ok, m = pcall(require, path)
  if not ok then
    print("ERROR: require " .. path)
    print("PATH: " .. debug.getinfo(2).source)
  end
  return ok, m
end

return safe_require;
