---@type MappingsTable
local M = {}

-- local lspLines = require("lsp_lines")

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- LSP line mappings
    ["<leader>yl"] = {
      function()
        require("lsp_lines").toggle()
        vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_lines }
      end,
      "Toggle lsp_lines",
      opts = { nowait = true },
    },
    ["<leader>yo"] = {
      function()
          vim.diagnostic.config { virtual_lines = false }
          vim.diagnostic.config { virtual_text = false }
      end,
      "Turns off diagnostic text",
      opts = { nowait = true },
    },
    ["<leader>yt"] = {
      function()
          vim.diagnostic.config { virtual_lines = false }
          vim.diagnostic.config { virtual_text = true }
      end,
      "Toggle LSP diagnostic text",
      opts = { nowait = true },
    },


  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
