-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    fg={"light_grey",10},
    italic = true,
  },
  Visual = {
    bg = { "light_grey",-20 },
    italic = true
  },
  CursorLine = {
    bg = {"black",5}
  }
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
