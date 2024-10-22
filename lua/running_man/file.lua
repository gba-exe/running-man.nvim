local function get_current_file()
  return vim.fn.expand("%")
end

local function get_filetype()
  local filetype = vim.bo.filetype
  return filetype
end

local function run_file(func, file)
  return func(file)
end

return {
  get_filetype = get_filetype,
  run_file = run_file,
  get_current_file = get_current_file
}
