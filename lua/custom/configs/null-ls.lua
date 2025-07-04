local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css"} }, -- so prettier works only on these filetypes
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  --groovy
  b.formatting.npm_groovy_lint.with {
    filetypes = { "groovy" },
  },
  b.diagnostics.npm_groovy_lint.with {
    filetypes = { "groovy" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
