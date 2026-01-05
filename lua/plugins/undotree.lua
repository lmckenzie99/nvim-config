-- lua/plugins/undotree.lua
return {
  "mbbill/undotree",
  keys = {
    { "<leader>ut", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 3  -- Opens on right side
    vim.g.undotree_SetFocusWhenToggle = 1  -- Focus undotree when opened
  end,
}
