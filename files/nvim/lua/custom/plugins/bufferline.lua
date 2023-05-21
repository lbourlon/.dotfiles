return {
  'akinsho/bufferline.nvim',
  dependencies = {'nvim-tree/nvim-web-devicons'},

  config = function()
    local bl = require("bufferline")

    bl.setup {
      options = {
        --mode = "ordinal",
      numbers = "ordinal",
        indicator = {style ="underline"},
        separator_style = "slant",
      custom_filter = function(buf, buf_nums)
        -- filter out filetypes you don't want to see

        if vim.bo[buf].buftype == "terminal" then
          return false
        end
        if vim.fn.bufname(buf) == "" or vim.fn.bufname(buf) == "[No Name]" then
          return false
        end
        return true

      end
      },
    }

    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", {desc="Cycle to Next bufferline"})
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", {desc="Cycle to Prev bufferline"})
    -- vim.keymap.set("n", "<leader>m", ":BufferLinePick<CR>", {desc="Buffer [C]hose"})

    -- local azerty_bs = '&é"\'(-è_çà'
    -- local c = azerty_bs:sub(i,i)

    -- for i = 1, 9, 1 do
    --   vim.keymap.set("n", "<leader>"..i, function() bl.go_to(i, true) end, {desc="Cycle to Prev bufferline"})
    -- end
    -- vim.keymap.set("n", "<leader>é", function() bl.go_to(2, true) end, {desc="Cycle to Prev bufferline"})



  end,
}


