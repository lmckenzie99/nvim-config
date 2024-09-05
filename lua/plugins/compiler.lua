return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  
  vim.api.nvim_set_keymap("n", "<Leader>co", "<cmd>CompilerOpen<CR>", {}),
  vim.api.nvim_set_keymap("n", "<S-F6>", "<cmd>CompilerStop<CR>" .. "<cmd>CompilerRedo<CR>", {}),
  vim.api.nvim_set_keymap("n", "<S-F7>", "<cmd>CompilerToggleResults", {}),
}
