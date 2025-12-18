return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async", -- Required dependency for nvim-ufo
    "nvim-treesitter/nvim-treesitter", -- Optional: for treesitter-based folding
  },
  config = function()
    -- Open all folds by default, zm is not available
    vim.opt.foldlevelstart = 99
    -- Handle folds via nvim-ufo
    vim.keymap.set("n", "zR", require("ufo").openAllFolds)
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Prioritize treesitter folding if available, fallback to indent
        return { "treesitter", "indent" }
      end,
    })
  end,
}
