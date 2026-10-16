require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "gopls",
  "groovyls",
  "jsonls",
  "bashls",
  "lemminx",
  "lua_ls",
  "basedpyright",
  "prettier",
  "yamlls",
  "kotlin-lsp",
  "marksman",
  "markdownlint"
}

vim.lsp.config("jdtls", {
  cmd = { "/home/daniel/.local/share/nvim/mason/bin/jdtls" },
})

vim.lsp.enable(servers)
vim.lsp.enable "jdtls"

vim.lsp.config("groovyls", {
  cmd = {
    "java",
    "-jar",
    "/home/daniel/.local/share/nvim/mason/packages/groovy-language-server/build/libs/groovy-language-server-all.jar",
  },
})
return servers
-- read :h vim.lsp.config for changing options of lsp servers
