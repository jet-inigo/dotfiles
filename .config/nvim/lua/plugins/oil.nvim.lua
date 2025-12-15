return {
    "https://github.com/stevearc/oil.nvim",
    config = function()
        require("oil").setup()
    end,
    keys = {
        { "-", "<Cmd>Oil<CR>", desc = "Browse files from here" },
    },
}
