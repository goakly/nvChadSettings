require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>vs", "<cmd> vs <CR>", { desc = "Split vertical" })
map("n", "<leader>hs", "<cmd> split <CR>", { desc = "Split Horizontal" })
map("n", "<leader>ng", "<ESC><cmd>Neogen<CR>", { desc = "Generate Documentation with NeoGen" })

-- Use telescope for diagnostics
map("n", "<leader>q", "<ESC><cmd>Telescope diagnostics bufnr=0 <CR>", { desc = "Show Buffer Diagnostics in Telescope" })

-- Use telescope for lsp_incoming_calls
map("n", "<leader>gci", "<ESC><cmd>Telescope lsp_incoming_calls <CR>", { desc = "Show Incoming calls in Telescope" })
map("n", "<leader>gco", "<ESC><cmd>Telescope lsp_outgoing_calls <CR>", { desc = "Show Outgoing calls in Telescope" })

-- Use telescope for lsp_implementations
map(
  "n",
  "<leader>gi",
  "<ESC><cmd>Telescope lsp_implementations <CR>",
  { desc = "Show Buffer Implementations in Telescope" }
)

-- Use telescope for lsp_definitions
map("n", "<leader>gd", "<ESC><cmd>Telescope lsp_definitions <CR>", { desc = "Show Buffer Definitions in Telescope" })

-- Use telescope for lsp_references
map("n", "<leader>gr", "<ESC><cmd>Telescope lsp_references <CR>", { desc = "Show Buffer References in Telescope" })

-- Use telescope for spelling suggestions
map(
  "n",
  "<leader>gsp",
  "<ESC><cmd>Telescope spell_suggest  <CR>",
  { desc = "Show Spelling Suggestions for word under cursor in Telescope" }
)

-- Use telescope for lsp_document_symbols
map(
  "n",
  "<leader>gss",
  "<ESC><cmd>Telescope lsp_document_symbols <CR>",
  { desc = "Show Treesitter names in Telescope" }
)

map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end)
-- LSP line mappings (functions should be handled contextually, below is the example for function mappings)
map("n", "<leader>yl", function()
  require("lsp_lines").toggle()
  vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_lines }
end, { desc = "Toggle lsp_lines" })

map("n", "<leader>yo", function()
  vim.diagnostic.config { virtual_lines = false }
  vim.diagnostic.config { virtual_text = false }
end, { desc = "Turns off diagnostic text" })

map("n", "<leader>yt", function()
  vim.diagnostic.config { virtual_lines = false }
  vim.diagnostic.config { virtual_text = true }
end, { desc = "Toggle LSP diagnostic text" })
map("n", "<leader>lf", function()
  vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Toggle lsp_lines" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr><ESC>")
