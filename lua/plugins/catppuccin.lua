return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        latte = require("catppuccin.palettes").get_palette("latte"),
        frappe = require("catppuccin.palettes").get_palette("frappe"),
        macchiato = require("catppuccin.palettes").get_palette("macchiato"),
        mocha = require("catppuccin.palettes").get_palette("mocha"),
        flavour = "auto", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,          -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,        -- percentage of the shade to apply to the inactive window
        },
        highlight_overrides = {
          all = function(colors)
            return {
              CurSearch = { bg = colors.sky },
              IncSearch = { bg = colors.sky },
              CursorLineNr = { fg = colors.blue, style = { "bold" } },
              DashboardFooter = { fg = colors.overlay0 },
              TreesitterContextBottom = { style = {} },
              WinSeparator = { fg = colors.overlay0, style = { "bold" } },
              ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
              ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
              Headline = { style = { "bold" } },
              Headline1 = { fg = colors.blue, style = { "bold" } },
              Headline2 = { fg = colors.pink, style = { "bold" } },
              Headline3 = { fg = colors.lavender, style = { "bold" } },
              Headline4 = { fg = colors.green, style = { "bold" } },
              Headline5 = { fg = colors.peach, style = { "bold" } },
              Headline6 = { fg = colors.flamingo, style = { "bold" } },
              rainbow1 = { fg = colors.blue, style = { "bold" } },
              rainbow2 = { fg = colors.pink, style = { "bold" } },
              rainbow3 = { fg = colors.lavender, style = { "bold" } },
              rainbow4 = { fg = colors.green, style = { "bold" } },
              rainbow5 = { fg = colors.peach, style = { "bold" } },
              rainbow6 = { fg = colors.flamingo, style = { "bold" } },
            }
          end,
        },
        no_italic = false,    -- Force no italic
        no_bold = false,      -- Force no bold
        no_underline = false, -- Force no underline
        styles = {            -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = { "italic" },
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {

          mocha = {
            rosewater = "#e0ceca", --c
            flamingo = "#e3c1c1", --c
            pink = "#e0b1d4", --c
            mauve = "#c4a4eb", --c
            red = "#d2788c", --c
            maroon = "#eba0ac",
            peach = "#f6b596", --c
            yellow = "#e6d0a1", --c
            green = "#8faf77", --c
            teal = "#88d1c5", --c
            sky = "#82d2e0", --c
            sapphire = "#6dbade", --c
            blue = "#7aa0de", --c
            lavender = "#b4befe", --h
            text = "#d5daf0", --c
            subtext1 = "#bac2de", --h
            subtext0 = "#a6adc8", --h
            overlay2 = "#9399b2", --h
            overlay1 = "#7f849c", --h
            overlay0 = "#6c7086", --h
            surface2 = "#585b70", --h
            surface1 = "#45475a", --h
            surface0 = "#313244", --h
            base = "#1b1f20", --c
            mantle = "#151819", --c
            crust = "#0e1011", --c
          },
        },
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          alpha = true,
          harpoon = true,
          rainbow_delimiters = true,
          nvimtree = true,
          semantic_tokens = false,
          ts_rainbow = true,
          cmp = true,
          gitsigns = true,
          neotree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          telescope = {
            enabled = true,
            style = "mocha",
          },
          indent_blankline = {
            enabled = true,
            scope_color = "mocha",
            colored_indent_levels = false,
          },
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
