local handle_file = require("running_man.file")
local handle_java = require("running_man.java")

local function define_runner(filetype)
  if filetype == "lua" then
    return function(file)
      return vim.cmd("luafile " .. file)
    end
  elseif filetype == "python" then
    return function(file)
      return vim.cmd("!python " .. file)
    end
  elseif filetype == "java" then
    return function(file)
      return vim.cmd(
        "!mvn exec:java " ..
        "-Dexec.mainClass=\"" ..
        handle_java.path_to_package(file) .. "\""
      )
    end
  else
    error("Unsupported filetype: " .. filetype)
  end
end

local function run()
  handle_file.run_file(
    define_runner(handle_file.get_filetype()), vim.fn.expand("%"))
end

return {
  run = run
}
