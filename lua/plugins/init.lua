local overrides = require "plugins.configs.overrides"
local snacks = require "plugins.configs.snacks"
local jdtls = require "plugins.configs.jdtls"
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for plugins.setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" }, -- Required
    },
    config = function()
      local lsp = require "lsp-zero"
      lsp.preset "recommended"
      lsp.on_attach(function(client, bufnr)
        require("lsp-format").on_attach(client, bufnr)
      end)
      lsp.nvim_workspace()
      lsp.setup()
      vim.diagnostic.config { virtual_text = true }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
    config = function ()
      local config = jdtls
    end,
  },
  {
    "danymat/neogen",
    lazy = false,
    config = true,
  },
  -- Some quality of life stuff.
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.config
    opts = {
      bigfile = { enabled = true },
      notifier = {
        enabled = false,
        timeout = 3000,
      },
      picker = {
        enabled = true,
      },
      scroll = {
        enabled = true,
      },
      indent = {
        enabled = true,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      scope = {
        enabled = true,
      },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
    },
    keys = snacks.keys,
    init = snacks.init(),
  },
  -- Changes the UI for notifications and the command line
  {
    "folke/noice.nvim",
    config = function()
      require "plugins.configs.noice"
    end,
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "meznaric/key-analyzer.nvim",
    lazy = false,
    outs = {},
  },
  --Easier movement to word
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      label = {
        rainbow = {
          enabled = true,
        },
      },
      modes = {
        char = {
          jump_lables = true,
        },
        search = {
          enabled = true,
        },
      },
    },
    -- ttylua: ignore
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-p>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  -- Better java language support
  { "nvim-java/nvim-java" },
  -- Highlights current line
  -- { "miyakogi/conoline.vim", lazy = false },
  -- Some git tools.
  { "tpope/vim-fugitive", lazy = false },
  -- Breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    lazy = false,
  },
  -- Vim startup dashboard
  {
    "nvimdev/dashboard-nvim",
    config = function()
      require "plugins.configs.dashboard"
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
    -- Tools for working with content between brackets, quotes, etc.
    "vijaymarupudi/nvim-fzf",
  },
  -- Tools for working with content between brackets, quotes, etc.
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "nvim-lua/plenary.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  -- Underlines other usages of the word under the cursor
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
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
        ["q"] = require("telescope.actions").close,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      }
      conf.defaults.selection_caret = " "
      return conf
    end,
  },
  {
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        {
          -- snippet plugin
          "L3MON4D3/LuaSnip",
          dependencies = "rafamadriz/friendly-snippets",
          opts = { history = true, updateevents = "TextChanged,TextChangedI" },
          config = function(_, opts)
            require("luasnip").config.set_config(opts)
            require "nvchad.configs.luasnip"
          end,
        },

        -- autopairing of (){}[] etc
        {
          "windwp/nvim-autopairs",
          opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          },
          config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- setup cmp for autopairs
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end,
        },

        -- cmp sources plugins
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
    priority = 0, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
      init = function()
        require "plugins.configs.hlargs"
      end,
    },
  },
}
