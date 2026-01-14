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

-- Open mini.files
vim.keymap.set("n", "-", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
  MiniFiles.open(path)
  MiniFiles.reveal_cwd()
end, { desc = "Open Mini Files" })

-- bufferline.nvim hotkeys
vim.keymap.set("n", "<S-q>", ":bd<CR>", opts)
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<C-h>", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "<C-l>", ":BufferLineMoveNext<CR>", opts)
