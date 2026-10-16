local overrides = require "plugins.configs.overrides"
local snacks = require "plugins.configs.snacks"

return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "plugins.configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require "plugins.configs.todo_comments",
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "folke/trouble.nvim",
    opts = require "plugins.configs.trouble",
    cmd = "Trouble",
    keys = {
      { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
    },
    config = require "plugins.configs.lspzero",
  },

  {
    "mfussenegger/nvim-jdtls",
    config = require "plugins.configs.jdtls",
  },

  {
    "danymat/neogen",
    lazy = false,
    config = true,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = snacks.opts,
    keys = snacks.keys,
    init = snacks.init,
  },

  {
    "folke/noice.nvim",
    config = function()
      require "plugins.configs.noice"
    end,
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "meznaric/key-analyzer.nvim",
    lazy = false,
    outs = {},
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = require "plugins.configs.flash",
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-p>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  { "nvim-java/nvim-java" },
  { "tpope/vim-fugitive", lazy = false },

  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    lazy = false,
  },

  {
    "nvimdev/dashboard-nvim",
    config = function()
      require "plugins.configs.dashboard"
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    lazy = false,
  },

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
    "vijaymarupudi/nvim-fzf",
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = require "plugins.configs.nvim_surround",
  },

  { "ThePrimeagen/harpoon" },

  {
    "nvim-lua/plenary.nvim",
    config = require "plugins.configs.lsp_lines",
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
  },

  {
    "github/copilot.vim",
    lazy = true,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = require "plugins.configs.copilotchat",
    lazy = true,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = require "plugins.configs.telescope",
  },

  {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        {
          "L3MON4D3/LuaSnip",
          dependencies = "rafamadriz/friendly-snippets",
          opts = require "plugins.configs.luasnip",
        },
        {
          "windwp/nvim-autopairs",
          opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          },
          config = require "plugins.configs.autopairs",
        },
        {
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-nvim-lsp-signature-help",
          "hrsh7th/cmp-buffer",
          "kento-ogata/cmp-tsnip",
          "https://codeberg.org/FelipeLema/cmp-async-path.git",
        },
      },
      opts = function()
        return require "plugins.configs.cmp"
      end,
    },
    {
      "mason-org/mason-lspconfig.nvim",
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
    {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
        require("better_escape").setup()
      end,
    },
    {
      "m-demare/hlargs.nvim",
      priority = 0,
      init = function()
        require "plugins.configs.hlargs"
      end,
    },
  },
}
