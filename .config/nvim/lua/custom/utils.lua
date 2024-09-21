PRINT = function (obj)
  local my_str = ""
  if type(obj)=='table' then
    my_str = table.concat(obj, "\\n")
  else
    my_str = obj
  end

  vim.cmd(string.format(':echo "%s"', my_str))
end
