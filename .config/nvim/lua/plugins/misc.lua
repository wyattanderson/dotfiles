return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  "folke/lsp-colors.nvim",

  -- better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = { use_diagnostic_signs = true },
    keys = {
      {
        "<leader>xx",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "Trouble",
      },
    },
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    config = true,
  },

  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup()
    end,
  },
}
