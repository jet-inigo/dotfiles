return {
    "https://github.com/stevearc/oil.nvim",
    opts = {},
    dependencies = "https://github.com/nvim-tree/nvim-web-devicons",
    config = function()
        require("oil").setup({
            default_file_explorer = true,
        })
    end,
    keys = {
        { "-", "<Cmd>Oil<CR>", desc = "Browse files from here" },
    },
}
