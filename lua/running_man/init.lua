local M = {}

function M.santos()
  print("Santos sempre Santos!")
end

function M.reload()
  package.loaded["running_man"] = nil
  require("running_man")
end

function M.run()
  require("running_man.runner").run()
end

return M
