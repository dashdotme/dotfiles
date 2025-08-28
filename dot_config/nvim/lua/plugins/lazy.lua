return {
  -- nixos doesn't support mason
  { "williamboman/mason.nvim",           enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim",       enabled = false },

  { "windwp/nvim-autopairs",             enabled = false },
  { "windwp/nvim-ts-autotag",            enabled = false },
  { "echasnovski/mini.pairs",            enabled = false },

  -- bundled themes
  { "catppuccin/nvim",                   enabled = false },
  { "folke/tokyonight.nvim",             enabled = false },

  -- snacks explorer - overrides only
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.picker = vim.tbl_deep_extend("force", opts.picker or {}, {
        hidden = true,
        ignored = true,
      })

      opts.picker.sources = opts.picker.sources or {}

      opts.picker.sources.files = vim.tbl_deep_extend("force", opts.picker.sources.files or {}, {
        hidden = true,
        ignored = true,
      })

      opts.picker.sources.git_files = vim.tbl_deep_extend("force", opts.picker.sources.git_files or {}, {
        hidden = true,
        ignored = true,
        untracked = true,
      })

      return opts
    end,
  },

  -- alt terminal to snacks
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
    },
    -- config = true,
    keys = {
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
    },
  },

  -- theme (derived from wallpaper)
  {
    "AlphaTechnolog/pywal.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("pywal").setup()
      vim.cmd.colorscheme "pywal"
    end,
  },

  -- syntax sugar - enclose things with {y/d/c}s{motion}{char}
  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  -- mass file editing
  {
    "stevearc/oil.nvim",
    ---module 'oil'
    ---@type oil.SetupOpts
    opts = { default_file_explorer = false },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>o",
        function()
          require("oil").toggle_float()
        end,
        desc = "Toggle Oil",
      },
    },
    lazy = false,
  },

  -- quick file nav
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
    },
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon add file",
      },

      {
        "<leader>hh",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon menu",
      },

      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Harpoon file 1",
      },

      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Harpoon file 2",
      },

      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Harpoon file 3",
      },

      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Harpoon file 4",
      },

      {
        "<leader>fh",
        function()
          local harpoon = require "harpoon"
          local items = harpoon:list().items
          local picker_items = {}
          for i, item in ipairs(items) do
            if item.value and item.value ~= "" then
              table.insert(picker_items, {
                text = string.format("%d: %s", i, item.value),
                file = item.value,
                idx = i,
              })
            end
          end
          if #picker_items == 0 then
            vim.notify("No harpoon marks found", vim.log.levels.WARN)
            return
          end
          Snacks.picker {
            source = "static",
            items = picker_items,
            confirm = function(item)
              harpoon:list():select(item.idx)
            end,
          }
        end,
        desc = "Harpoon marks (snacks)",
      },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- git ui
  {
    "NeogitOrg/neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "folke/snacks.nvim",
    },
  },

 -- custom binds
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      spec = {
        { "<leader>h", group = "Harpoon", icon = "󰛢" },

        { "<leader>o", group = "Oil", icon = "󰏇" },

        { "<leader>t", group = "Terminal", icon = "󰆍" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
