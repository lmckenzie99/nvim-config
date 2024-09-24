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
              AlphaHeader = { bg = colors.green },
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
            rosewater = "#efc9c2",
						flamingo = "#ebb2b2",
						pink = "#f2a7de",
						mauve = "#b889f4",
						red = "#ea7183",
						maroon = "#ea838c",
						peach = "#f39967",
						yellow = "#eaca89",
						green = "#96d382",
						teal = "#78cec1",
						sky = "#91d7e3",
						sapphire = "#68bae0",
						blue = "#739df2",
						lavender = "#a0a8f6",
						text = "#b5c1f1",
						subtext1 = "#a6b0d8",
						subtext0 = "#959ec2",
						overlay2 = "#848cad",
						overlay1 = "#717997",
						overlay0 = "#63677f",
						surface2 = "#505469",
						surface1 = "#3e4255",
						surface0 = "#2c2f40",
						base = "#1a1c2a",
						mantle = "#141620",
						crust = "#0e0f16",          },
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
            colored_indent_levels = true,
          },
        },
      })

      -- setup must be called before loading
     -- vim.cmd.colorscheme("catppuccin")
    end,
  },
}
