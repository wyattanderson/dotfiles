vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":tabprev<CR>")

vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "zkj", "<ESC>:w<CR>")

vim.keymap.set("n", "<leader>n", ':vsplit <C-R>=expand("%:p:h") . "/" <CR>')

vim.keymap.set("n", "<leader><space>", ":let @/=''<CR>")
