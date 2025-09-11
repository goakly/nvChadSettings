local noice = require "noice"
noice.setup {
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    lsp_doc_border = true
  }
}
