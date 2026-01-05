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
    },

    handlers = {
      -- Default handler for all servers
      function(server_name)
        require("lspconfig")[server_name].setup({
          capabilities = capabilities,
          settings = {},
        })
      end,
    },
  },
}
