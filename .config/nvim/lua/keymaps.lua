local opts = { noremap = true, silent = true }

-- Create splits
vim.keymap.set("n", "<C-w>u", ":split<CR>", opts)
vim.keymap.set("n", "<C-w>i", ":vsplit<CR>", opts)

-- Toggle diagnostics
vim.keymap.set("n", "<leader>h", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = "Toggle diagnostics" })
