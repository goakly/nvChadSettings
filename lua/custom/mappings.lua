---@type MappingsTable
local M = {}

-- local lspLines = require("lsp_lines")

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
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
        if vim.diagnostic.config().virtual_lines then
          require("lsp_lines").toggle()
        end
          vim.diagnostic.config { virtual_text = false }
      end,
      "Toggle lsp_lines",
      opts = { nowait = true },
    },
    ["<leader>yt"] = {
      function()
        if vim.diagnostic.config().virtual_lines then
          require("lsp_lines").toggle()
        end
          vim.diagnostic.config { virtual_text = true }
      end,
      "Toggle lsp_lines",
      opts = { nowait = true },
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
