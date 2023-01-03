return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<c-p>", "<cmd>Telescope find_files<cr>" },
  },
}
