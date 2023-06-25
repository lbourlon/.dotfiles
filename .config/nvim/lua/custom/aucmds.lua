-- Autosave things
local auto_save_flag = false
local save_id

vim.api.nvim_create_user_command('Save', function()
  if(auto_save_flag) then
    auto_save_flag = false
    vim.api.nvim_del_autocmd(save_id)
  else
    auto_save_flag = true
    local event_list = {"BufLeave", "BufWinLeave","WinLeave"}
    save_id = vim.api.nvim_create_autocmd(event_list,{command = "silent! w!"})
    vim.api.nvim_create_autocmd({"FocusLost"},{command = "silent! wa"})
  end
  print("AutoSave is now set to : ",auto_save_flag)
end, { desc = 'Change Auto Save State' })

-- AutoSave to here
vim.api.nvim_create_user_command(
  'DirectoryLoad',
  function ()
    vim.cmd("Lazy load bufferline.nvim")
    vim.cmd("Lazy load neo-tree.nvim")
  end,
  { desc = 'Change Auto Save State' })

local bob = vim.api.nvim_create_augroup("bob", {clear = true})

vim.api.nvim_create_autocmd("VimEnter",
  {
    callback = function()
      if vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
        vim.cmd("Save")
      else
        print("No Autosave")
      end
    end,
    group=bob,
  }

)
