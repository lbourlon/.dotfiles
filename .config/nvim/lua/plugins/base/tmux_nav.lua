return {
  'christoomey/vim-tmux-navigator',
  commit = '7db70e0',
  -- commit = "85b8e5f60c1690cde57dbb66467ce39cd1b63343",

  config = function ()
    local nmap = function(keys, func, desc)
      vim.keymap.set({'n','t','i','v'}, keys, "<C-\\><C-N>" .. func, {desc = 'TMUX: ' .. desc })
    end

    nmap("<A-k>", ":TmuxNavigateUp<CR>", "NavigateUp")
    nmap("<A-j>", ":TmuxNavigateDown<CR>", "NavigateDown")
    nmap("<A-h>", ":TmuxNavigateLeft<CR>", "NavigateLeft")
    nmap("<A-l>", ":TmuxNavigateRight<CR>", "NavigateRight")

    vim.keymap.del("n", "<C-k>")
    vim.keymap.del("n", "<C-j>")
    vim.keymap.del("n", "<C-l>")
    vim.keymap.del("n", "<C-h>")
  end
}
