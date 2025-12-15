return {
    "https://github.com/junegunn/fzf.vim",
    dependencies = {
        "https://github.com/junegunn/fzf",
    },
    keys = {
        { "<Leader><Leader>", "<Cmd>Files<CR>", desc = "Find files" },
        { "<Leader>,", "<Cmd>Buffers<CR>", desc = "Find buffers" },
        { "<Leader>/", "<Cmd>Rg<CR>", desc = "Search project" },
    },
}
