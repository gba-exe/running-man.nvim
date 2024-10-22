local function split_string(str)
  local parts = {}

  for part in str:gmatch("([^/]+)") do
    table.insert(parts, part)
  end
  return parts
end

local function find_java_index(str_table)
  for i, string in ipairs(str_table) do
    if string == "java" then
      return i
    end
  end
end

local function table_to_package(name_index, str_table)
  local result_package = {}
  if name_index then
    for i = name_index + 1, #str_table do
      if i == #str_table then
        table.insert(result_package, str_table[i]:match("(.+)%..+"))
      else
        table.insert(result_package, str_table[i])
      end
    end
  else
    error("Invalid path")
  end

  local str_result = table.concat(result_package, ".")
  return str_result
end

local function path_to_package(str)
  local splitted_string = split_string(str)
  return table_to_package(find_java_index(splitted_string), splitted_string)
end

return {
  path_to_package = path_to_package
}
