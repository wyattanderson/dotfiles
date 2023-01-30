return {
  "cappyzawa/starlark.vim",
  config = function()
    vim.filetype.add({
      extension = {
        Tiltfile = "starlark",
      },
    })
  end,
}
