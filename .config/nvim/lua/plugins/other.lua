return {
  "rgroli/other.nvim",
  config = function()
    require("other-nvim").setup({
      mappings = {
        {
          pattern = "(.*).go",
          target = "%1_test.go",
          context = "tests",
        },
        {
          pattern = "(.*)_test.go",
          target = "%1.go",
          context = "implementation",
        },
      },
    })
  end,
}
