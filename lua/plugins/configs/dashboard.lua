local dashboardConfig = require("dashboard").setup {
  theme = "hyper",
  shortcut_type = "number",
  config = {
    week_header = {
      enable = true,
      append = {},
    },
    shortcut = {
      { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
    },
  },
}
return dashboardConfig
