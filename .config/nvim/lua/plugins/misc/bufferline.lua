return {
  'akinsho/bufferline.nvim',

  cmd="DirectoryLoad", -- Lazy Load

  dependencies = {{'nvim-tree/nvim-web-devicons'}},

  config = function()
    require("bufferline").setup{
        options = {
        mode = "buffers",
        -- style_preset = bl.presets.default,
        themable = true,
        indicator = {style ="underline"},
        separator_style = "thick",
        show_close_icon = false,
        --enforce_regular_tabs = false | true,

      -- filter out filetypes you don't want to see
      -- custom_filter = function(buf)
      --   if vim.bo[buf].buftype == "terminal" then return false end
      --   -- if vim.fn.bufname(buf) == ""  then return false end
      --   -- if vim.fn.bufname(buf) == "[No Name]" then return false end
      --   return true
      -- end
      },
    }

    -- vim.keymap.set("n", "<leader>m", ":BufferLinePick<CR>", {desc="Buffer [C]hose"})


    -- vim.keymap.set("n", "<S-m><S-l>", ":BufferLineMoveNext<CR>", {desc="Cycle to Prev bufferline"})
    vim.keymap.set("n", "<S-m><S-q>", function ()
      local to_close_bufnr = vim.cmd(":echo bufnr('%')")
      vim.cmd("BufferLineCycleNext")
      local current_bufnr = vim.cmd(":echo bufnr('%')")

      if to_close_bufnr ~= current_bufnr then
        vim.cmd(":bd#")
      else
        vim.cmd(":q")
      end
    end, {desc="Close current and move Right"})

    vim.keymap.set("n", "<S-m><S-l>", ":BufferLineMoveNext<CR>", {desc="Cycle to Prev bufferline"})
    vim.keymap.set("n", "<S-m><S-h>", ":BufferLineMovePrev<CR>", {desc="Cycle to Prev bufferline"})
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", {desc="Cycle to Next bufferline"})
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", {desc="Cycle to Prev bufferline"})
    vim.keymap.set("n", "<S-x>", ":BufferLineCycleNext<CR>BufferLineCycleNext<CR>", {desc="Cycle to Next bufferline"})
  end,
}


