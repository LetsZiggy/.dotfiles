-- [[ https://github.com/nvim-lualine/lualine.nvim#default-configuration ]]
-- [[ https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/evil_lualine.lua ]]

local colors = require("tokyonight.colors").setup()
local utils = require("tokyonight.util")

colors.violet = colors.purple

local mode_color = {
  n = colors.red,
  no = colors.magenta,
  nov = colors.magenta,
  noV = colors.magenta,
  ["no"] = colors.magenta,
  niI = colors.red,
  niR = colors.red,
  niV = colors.red,
  nt = colors.red,
  ntT = colors.red,
  v = colors.blue,
  vs = colors.blue,
  V = colors.blue,
  Vs = colors.blue,
  [""] = colors.blue,
  ["s"] = colors.blue,
  s = colors.orange,
  S = colors.orange,
  [""] = colors.orange,
  i = colors.yellow,
  ic = colors.yellow,
  ix = colors.yellow,
  R = colors.violet,
  Rc = colors.violet,
  Rx = colors.violet,
  Rv = colors.violet,
  Rvc = colors.violet,
  Rvx = colors.violet,
  c = colors.magenta,
  cv = colors.magenta,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.magenta,
  t = colors.magenta,
  e = colors.magenta, -- UNKNOWN
  ci = colors.magenta, -- UNKNOWN
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,

  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,

  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    theme = {
      normal = {
        c = {
          fg = colors.fg_dark,
          bg = colors.bg_highlight,
        },
      },
      inactive = {
        c = {
          fg = colors.fg_dark,
          bg = colors.bg_highlight,
        },
      },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {},
}

local function ins_left_section(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right_section(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left_section({
  function()
    return "▊"
  end,

  color = function()
    return({
      fg = mode_color[vim.fn.mode()],
    })
  end,

  padding = {
    left = 0,
    right = 1,
  },
})

ins_left_section({
  "mode",

  color = function()
    return({
      fg = mode_color[vim.fn.mode()],
    })
  end,
})

--ins_left_section({
--  "filesize",
--  cond = conditions.buffer_not_empty,
--})

ins_left_section({
  "filename",
  path = 1,
  shorting_target = 100,
  cond = conditions.buffer_not_empty,
  color = {
    fg = colors.magenta,
    gui = "bold",
  },
})

ins_left_section({
  "location",
})

ins_left_section({
  "progress",
  color = {
    fg = colors.fg,
  },
})

ins_left_section({
  "diagnostics",
  sources = {
    "nvim_diagnostic",
  },
  symbols = {
    error = " ",
    warn = " ",
    info = " ",
  },
  diagnostics_color = {
    color_error = {
      fg = colors.red,
    },
    color_warn = {
      fg = colors.yellow,
    },
    color_info = {
      fg = colors.cyan,
    },
  },
})

ins_left_section({
  function()
    return "%="
  end
})

ins_left_section({
  function()
    local msg = "No Active LSP"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
      return msg
    end

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes

      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end

    return msg
  end,

  icon = " LSP:",
  color = {
    fg = "#ffffff",
    gui = "bold",
  },
})

ins_right_section({
  "branch",
  icon = "",
  color = {
    fg = colors.violet,
    gui = "bold",
  },
})

ins_right_section({
  "diff",
  symbols = {
    added = " ",
    modified = "柳 ",
    removed = " ",
  },
  diff_color = {
    added = {
      fg = colors.green,
    },
    modified = {
      fg = colors.orange,
    },
    removed = {
      fg = colors.red,
    },
  },
  cond = conditions.hide_in_width,
})

ins_right_section({
  "o:encoding",
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = {
    fg = colors.green,
  },
})

ins_right_section({
  "fileformat",
  fmt = string.upper,
   symbols = {
    unix = "",
    dos = "",
    mac = "",
  },
  color = {
    fg = colors.green,
  },
})

ins_right_section({
  function()
    return "▊"
  end,

  color = function()
    return({
      fg = mode_color[vim.fn.mode()],
    })
  end,

  padding = {
    left = 1,
    right = 0,
  },
})

local function ins_left_tabline(component)
  table.insert(config.tabline.lualine_c, component)
end

ins_left_tabline({
  "buffers",
  max_length = function() return vim.o.columns end,
  show_filename_only = true,
  hide_filename_extension = false,
  mode = 4,
  buffers_color = {
    active = {
      fg = colors.fg_dark,
      bg = colors.bg_highlight,
      gui="bold",
    },
    inactive = {
      fg = colors.comment,
      bg = colors.bg_highlight,
    },
  },
})

require("lualine").setup(config)
