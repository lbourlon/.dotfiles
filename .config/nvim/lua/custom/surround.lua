-- My Surround
local surround_chars={['(']=')',['[']=']',['{']='}',['<']='>',['<p>']='</p>'}

local function take_some_input(f_consume, prompt_txt)
  vim.ui.input({prompt = prompt_txt},
    function(input)
      if input == nil or input == "" then
        return
      end
      f_consume(input)
    end
  )
end

-- ============== Surround ============== --
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

-- -- ============== Align ============== --
local function align(input)
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
vim.keymap.set('v','<leader>ma', function() call_function_on_input(align, "Align on : ") end, {desc = "[M]isc [A]lign"})

-- int bob         = 42  ;
-- int   bob        = 42 ;
-- int always_truebob = 42  ;   

