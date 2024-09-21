-- =============== Input ================ --
local function call_function_on_input(func, prompt_txt)
  vim.ui.input({prompt = prompt_txt},
    function(input)
      if input == nil or input == "" then
        return
      end
      func(input)
    end
  )
end

-- ============== Surround ============== --
local surround_chars={['(']=')',['[']=']',['{']='}',['<']='>',['<p>']='</p>'}
local function surround_selection(input)
  local yang = surround_chars[input]
  if yang == nil then
    yang = input
  end
  vim.cmd("norm c" .. input .. yang)
  local r,c = unpack(vim.api.nvim_win_get_cursor(0)) -- get position
  vim.api.nvim_win_set_cursor(0, {r, c - yang:len()})
  vim.cmd("norm p")
end

local function surround_remove_one_char(input)
  vim.cmd('norm vi' .. input)
  vim.cmd('norm "udXx"uP')
end

vim.keymap.set('v', '<leader>s',
  function() call_function_on_input(surround_selection, "Surround with : ") end,
  {desc="Sourround"})

vim.keymap.set('n', '<leader>ds',
  function() call_function_on_input(surround_remove_one_char, "Unsurround : ") end,
  {desc="Unsurround"})


-- =============== Align ================ --
local function lualign(input)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>" , true, false, true), 'x', true)

  local endl = vim.fn.line("'>")
  local startl = vim.fn.line("'<")
  local lines = vim.api.nvim_buf_get_lines(0, startl - 1, endl, false)

  local min_len = -1;
  for _, line in ipairs(lines) do
    local before = line:match("(.*) *" .. input)
    if before == nil then goto continue end
    before = before:gsub("%s+$", "")

    if min_len < before:len() then
      min_len = before:len()
    end
    ::continue::
  end
  if min_len == -1 then return end

  local aligned_lines = {}
  for _, line in ipairs(lines) do
    -- captures all characters before input then trim whitespace
    local before = line:match("(.*) *" .. input)
    if before == nil then
      table.insert(aligned_lines, line) -- ignore non matching lines
      goto continue
    end
    before = before:gsub("%s+$", "")

    local padding = string.rep(' ', min_len - before:len())
    local after = line:match(input .. "%s*(.*)")

    -- add space around equals
    if input == '=' then
      if after ~= "" then
        after = ' ' .. after
      end
      padding = padding .. ' '
    end

    table.insert(aligned_lines, before .. padding .. input .. after)
    ::continue::
  end

  vim.api.nvim_buf_set_lines(0, startl - 1, endl, false, aligned_lines)
end
vim.keymap.set('v','<leader>ma', function() call_function_on_input(lualign, "Align on : ") end, {desc = "[M]isc [A]lign"})

-- =============== CLI fn =============== --
local function shell_commands_on_selection(input)
  -- local esc_string = "<C-\\><C-N>"
  local esc_termcode = vim.api.nvim_replace_termcodes("<esc>" , true, false, true)
  if (input == "=") then
    vim.api.nvim_feedkeys(esc_termcode, 'x', true)
    vim.cmd('norm gv')
    vim.cmd("'<,'>!tr -s ' ' | sed -e 's/\\s*=\\s*/=/g' | column -t -s '=' -o ' = '")
    vim.api.nvim_feedkeys(esc_termcode, 'x', true)
  else
    vim.api.nvim_feedkeys(esc_termcode, 'x', true)
    vim.cmd('norm gv')
    vim.cmd(string.format("'<,'>!column -t -s '%s' -o '%s'", input, input))
    vim.api.nvim_feedkeys(esc_termcode, 'x', true)
  end
end
