return {
  "lifepillar/vim-solarized8",
  config = function()
    vim.opt.termguicolors = true
    vim.g.solarized_termtrans = 1
    vim.cmd.colorscheme("solarized8")
    vim.opt.background = "dark"
  end,
}
