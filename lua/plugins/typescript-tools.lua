return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    name = "typescript-tools",
    config = function()
      require("typescript-tools").setup({})
    end,
  },
}
