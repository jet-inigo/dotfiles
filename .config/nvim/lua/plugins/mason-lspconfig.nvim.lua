return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason.nvim",
  },
  opts = {
    ensure_installed = {
      "basedpyright",
      "clangd",
      "csharp_ls",
      "lua_ls",
    },

    handlers = {
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    },
  },
}

