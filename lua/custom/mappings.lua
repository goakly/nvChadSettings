---@type MappingsTable
local M = {}

-- local lspLines = require("lsp_lines")
M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>vs"] = { "<cmd> vs <CR>", "Split vertical" },
    ["<leader>hs"] = { "<cmd> split <CR>", "Split Horizontal" },
    ["<leader>ng"] = {
      "<ESC><cmd>Neogen<CR>",
      "Generate Documentation with NeoGen",
    },
    -- Use telescope for diagnostics
    ["<leader>q"] = {
      "<ESC><cmd>Telescope diagnostics bufnr=0 <CR>",
      "Show Buffer Diagnostics in Telescope",
    },
    -- Use telescope for lsp_implementations
    ["<leader>gci"] = {
      "<ESC><cmd>Telescope lsp_incoming_calls <CR>",
      "Show Incoming calls in Telescope",
    },
    ["<leader>gco"] = {
      "<ESC><cmd>Telescope lsp_outgoing_calls <CR>",
      "Show Outgoing calls in Telescope",
    },
    -- Use telescope for lsp_implementations
    ["<leader>gi"] = {
      "<ESC><cmd>Telescope lsp_implementations <CR>",
      "Show Buffer Implementations in Telescope",
    },
    -- Use telescope for lsp_definitions
    ["<leader>gd"] = {
      "<ESC><cmd>Telescope lsp_definitions <CR>",
      "Show Buffer Definitions in Telescope",
    },
    ["<leader>gr"] = {
      "<ESC><cmd>Telescope lsp_references <CR>",
      "Show Buffer References in Telescope",
    },
    ["<leader>gsp"] = {
      "<ESC><cmd>Telescope spell_suggest  <CR>",
      "Show Spelling Suggestions for word under cursor in Telescope",
    },
    ["<leader>gss"] = {
      "<ESC><cmd>Telescope lsp_document_symbols <CR>",
      "Show Treesitter names in Telescope",
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
    -- [">"] = { ">gv", "indent" }
  },

  -- more keybinds!
}
return M
