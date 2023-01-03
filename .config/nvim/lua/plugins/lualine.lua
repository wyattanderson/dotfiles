return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" },
  },
  config = function()
    require("lualine").setup()
  end,
}
