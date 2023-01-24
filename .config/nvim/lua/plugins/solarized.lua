return {
  "ishan9299/nvim-solarized-lua",
  config = function()
    vim.opt.termguicolors = true
    vim.g.solarized_termtrans = 1
    vim.cmd.colorscheme("solarized")
  end,
}
