local overrides = require "custom.configs.overrides"

local gitVersion = require("core.utils").get_latest_git_timestamp()
--@type NvPluginSpec[]
local plugins = {
  --Easier movement to word
  {'easymotion/vim-easymotion', lazy=false},
  -- Better java language support
  {'nvim-java/nvim-java'},
  {"miyakogi/conoline.vim", lazy= false},
  -- Override plugin definition options
  {"tpope/vim-fugitive", lazy = false },
  -- Breadcrumbs
  {"Bekaboo/dropbar.nvim",
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    lazy=false
  },
  -- Shows vim shortcuts in editor
  { "tris203/precognition.nvim", lazy = false,
    opts = {
     startVisible = false,
    },},
  -- Vim startup dashboard
  {
    "nvimdev/dashboard-nvim",
    config = function()
      require("dashboard").setup {
        theme = "hyper",
        shortcut_type = "number",
        config = {
          week_header = {
            enable = true,
            append = {
              "Last Pulled: " .. gitVersion,
            },
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    lazy = false,
  },
  --Automatically toggles relative line numbers
  { "sitiom/nvim-numbertoggle", lazy = false },
  --Adds colors to bracket pairs
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = false,
  },
  --Adds colors to window separators to indicate active window
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  --Adds line from lsp messages to cause
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
    -- override plugin configs
    {
      "williamboman/mason.nvim",
      opts = overrides.mason,
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
    -- Adds color to arguments passed to function
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
    },
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
  },
}
return plugins
