--[=[
install delve
```
go install github.com/go-delve/delve/cmd/dlv@latest
```

if you want to debug inside docker you have to add flag `--privileged`
```
docker run --privileged <images name> <command>
```
--]=]

local safe_require = require("rin.utils.safe_require")
local ok_dap, dap = safe_require("dap")
local ok_dap_utils, dap_utils = safe_require("dap.utils")
local ok_dap_repl, dap_repl = safe_require("dap.repl")

if not (ok_dap and ok_dap_utils and ok_dap_repl) then
  return
end

dap.adapters.dlv = function(callback, config)
  local stdout = vim.loop.new_pipe(false)
  local handle
  local pid_or_err
  local port = 38697
  local opts = {
    stdio = {nil, stdout},
    args = {"dap", "-l", "127.0.0.1:" .. port},
    detached = true
  }
  handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
    stdout:close()
    handle:close()
    if code ~= 0 then
      print("dlv exited with code", code)
    end
  end)
  assert(handle, "Error running dlv: " .. tostring(pid_or_err))
  stdout:read_start(function(err, chunk)
    assert(not err, err)
    if chunk then
      vim.schedule(function()
        dap_repl.append(chunk)
      end)
    end
  end)
  -- Wait for delve to start
  vim.defer_fn(
    function()
      callback({type = "server", host = "127.0.0.1", port = port})
    end,
    100)
end

dap.configurations.go = {
  {
    type = "dlv",
    request = "launch",
    name = "Launch Current File (Delve)",
    program = "${file}",
  },
  {
    type = "dlv",
    request = "launch",
    name = "Launch Package Program (Delve)",
    program = "${fileDirname}",
  },
  {
    type = "dlv",
    request = "launch",
    name = "Launch Debug Test Current File (Delve)",
    mode = "test",
    program = "${file}",
  },
  {
    type = "dlv",
    request = "launch",
    name = "Launch Debug Test (go.mod) (Delve)",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
  {
    type = "dlv",
    request = "attach",
    name = "Attach Program (Delve)",
    mode = "local",
    processId = dap_utils.pick_process,
  },
}
