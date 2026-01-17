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
    },
  },
}
