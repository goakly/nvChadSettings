---@type MappingsTable
local M = {}

-- local lspLines = require("lsp_lines")

M.general = {
  n = {

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<leader>vs"] = { "<cmd> vs <CR>", "Split vertical", opts = { nowait = true } },
    ["<leader>hs"] = { "<cmd> hs <CR>", "Split Horizontal", opts = { nowait = true } },

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

M.nvimtree = {
  n = {
    ["l"] = {
      function()
         require("nvim-tree.api").node.open.edit()
      end,
      "Open directory/file",
    },
    ["h"] = {
      function()
         require("nvim-tree.api").node.navigate.parent_close()
      end,
      "Open directory/file",
    },
  },
}
-- more keybinds!

return M
