return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<c-p>", "<cmd>Telescope find_files<cr>" },
    {
      "gd",
      "<cmd>Telescope lsp_definitions<cr>",
      { desc = "Goto Definition" },
    },
    {
      "gD",
      "<cmd>Telescope lsp_declarations<cr>",
      { desc = "Goto Declaration" },
    },
    { "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" } },
    {
      "gdt",
      function()
        require("telescope.builtin").lsp_definitions({
          jump_type = "tab",
        })
      end,
    },
    {
      "gdv",
      function()
        require("telescope.builtin").lsp_definitions({
          jump_type = "vsplit",
        })
      end,
    },
  },
}
