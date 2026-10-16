-- Lightweight lspconfig loader: keep this minimal to avoid interfering with other LSP tooling.
return function()
  -- This module intentionally does minimal setup: it ensures lspconfig is loaded.
  -- If you want to add per-server settings, move them here.
  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    return
  end
  -- Example: you can add server-specific setup here, e.g.
  -- lspconfig.pyright.setup {}
end
