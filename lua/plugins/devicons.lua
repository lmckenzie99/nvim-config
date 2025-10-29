return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_extension = {
        ["pl"] = {
          icon = "",
          color = "#E4B854",
          cterm_color = "179",
          name = "Prolog"
        },
      },
    })
  end,
}
