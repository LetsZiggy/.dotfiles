-- [[ https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration ]]

local config = {
  style = "storm",
  light_style = "day",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = {
      italic = false,
    },
    keywords = {
      italic = false,
    },
    functions = {
      italic = false,
    },
    variables = {
      italic = false,
    },
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = {},
  day_brightness = 0.3,
  hide_inactive_statusline = true,
  dim_inactive = true,
  lualine_bold = false,
  use_background = true,

  on_colors = function(colors)
    colors.comment = "#767FA9" -- #565F89
    colors.fg_gutter = "#565F89" -- #3B4261
  end,

  on_highlights = function(highlights, colors)
    highlights.LineNr = {
      fg=colors.comment,
    }
  end,
}

require("tokyonight").setup(config)
