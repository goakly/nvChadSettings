-- local autocmd = vim.api.nvim_create_autocmd
--map("n", "<dd>", '')
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
vim.api.nvim_set_keymap("n","dd","\"_dd",{ noremap = true })
