---@type MappingsTable
local M = {}

-- local lspLines = require("lsp_lines")

M.general = {
  n = {

    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>vs"] = { "<cmd> vs <CR>", "Split vertical" },
    ["<leader>hs"] = { "<cmd> split <CR>", "Split Horizontal" },

    -- Use telescope for diagnostics
    ["<leader>q"] = {
      "<ESC><cmd>Telescope diagnostics bufnr=0 <CR>",
      "Show Buffer Diagnostics",
    },
    -- LSP line mappings
    ["<leader>yl"] = {
      function()
        require("lsp_lines").toggle()
        vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_lines }
      end,
      "Toggle lsp_lines",
    },
    ["<leader>yo"] = {
      function()
        vim.diagnostic.config { virtual_lines = false }
        vim.diagnostic.config { virtual_text = false }
      end,
      "Turns off diagnostic text",
    },
    ["<leader>yt"] = {
      function()
        vim.diagnostic.config { virtual_lines = false }
        vim.diagnostic.config { virtual_text = true }
      end,
      "Toggle LSP diagnostic text",
    },
  },
  v = {
    -- [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
