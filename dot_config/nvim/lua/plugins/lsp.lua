return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Nix
        nixd = {},

        -- Rust
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },

        -- Python
        pyright = {},
        ruff = {
          init_options = {
            settings = {
              args = {}
            }
          }
        },

        -- JavaScript/TypeScript
        tsserver = {},

        -- Web
        html = {},
        cssls = {},
        jsonls = {},
        eslint = {},

        -- Angular
        angularls = {},

        -- Other languages
        ansiblels = {},
        bashls = {},
        clangd = {},
        omnisharp = {},
        elixirls = {},
        gopls = {},
        golangci_lint_ls = {},
        hls = {}, -- Haskell
        terraformls = {},
        helm_ls = {},
        hyprls = {},
        jqls = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        marksman = {},
        markdown_oxide = {},
        svelte = {},
        vuels = {},
        yamlls = {},
        zls = {},
      },
    },
  },
}
