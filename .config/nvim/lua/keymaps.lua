local opts = { noremap = true, silent = true }

-- Create splits
vim.keymap.set("n", "<C-w>u", ":split<CR>", opts)
vim.keymap.set("n", "<C-w>i", ":vsplit<CR>", opts)
