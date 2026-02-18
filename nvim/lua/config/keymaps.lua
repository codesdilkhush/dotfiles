local map = vim.keymap.set

map("v", "<C-x>", '"+d',  { desc = "Cut selection to clipboard" })
map("n", "<C-x>", '"+dd', { desc = "Cut line to clipboard" })
