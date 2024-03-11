local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {"ErichDonGubler/lsp_lines.nvim"},

  { "sitiom/nvim-numbertoggle", lazy = false },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  { "ErichDonGubler/lsp_lines.nvim" },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    {
      "kdheepak/lazygit.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim"
      },
      enabled = true,
      lazy = false,
    },
    -- override plugin configs
    {
      "williamboman/mason.nvim",
      opts = overrides.mason
    },

    {
      "nvim-treesitter/nvim-treesitter",
      opts = overrides.treesitter,
    },

    {
      "nvim-tree/nvim-tree.lua",
      opts = overrides.nvimtree,
    },

    -- Install a plugin
    {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
        require("better_escape").setup()
      end,
    },
    {
      "m-demare/hlargs.nvim",
      init = function()
        require("hlargs").setup {
          use_colorpalette = false,
          sequential_colorpalette = true,
          colorpalette = {
            { fg = "#ef9062" },
            { fg = "#3AC6BE" },
            { fg = "#35D27F" },
            { fg = "#EB75D6" },
            { fg = "#E5D180" },
            { fg = "#8997F5" },
            { fg = "#D49DA5" },
            { fg = "#7FEC35" },
            { fg = "#F6B223" },
            { fg = "#F67C1B" },
            { fg = "#DE9A4E" },
            { fg = "#BBEA87" },
            { fg = "#EEF06D" },
            { fg = "#8FB272" },
          },
          highlight = {
            fg = "#7FEC35",
            italic = true,
          },
        }
      end,
    }
    -- To make a plugin not be loaded
    -- {
    --   "NvChad/nvim-colorizer.lua",
    --   enabled = false
    -- },

    -- All NvChad plugins are lazy-loaded by default
    -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
    -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
    -- {
    --   "mg979/vim-visual-multi",
    --   lazy = false,
    -- }
  }
}
return plugins
