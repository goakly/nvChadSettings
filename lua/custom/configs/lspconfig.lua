local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd","jdtls","gopls","groovyls"}

for _, lsp in ipairs(servers) do

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

end

-- Custom setup for groovyls
lspconfig.groovyls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  cmd = {"java","-jar","/home/daniel/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar"}
}
-- 
-- lspconfig.pyright.setup { blabla}
