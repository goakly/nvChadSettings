-- Telescope tweaks for navigation and keys
return function(_, conf)
  conf.defaults.mappings.i = {
    ["<C-j>"] = require("telescope.actions").move_selection_next,
    ["<Esc>"] = require("telescope.actions").close,
    ["q"] = require("telescope.actions").close,
    ["<C-k>"] = require("telescope.actions").move_selection_previous,
  }
  conf.defaults.selection_caret = " "
  return conf
end
