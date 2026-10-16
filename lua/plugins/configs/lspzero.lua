-- lsp-zero setup extracted from plugins init
return function()
  local lsp = require "lsp-zero"
  lsp.preset "recommended"
  lsp.on_attach(function(client, bufnr)
    require("lsp-format").on_attach(client, bufnr)
  end)
  lsp.nvim_workspace()
  lsp.setup()
  vim.diagnostic.config { virtual_text = true }
end
