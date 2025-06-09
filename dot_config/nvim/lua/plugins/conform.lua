return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = false,
    formatters_by_ft = {
      -- Web/Frontend
      markdown = { "prettier" },
      yaml = { "yamlfmt", "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      svelte = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },

      -- Programming Languages
      python = { "ruff_format", "ruff_fix" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      lua = { "lsp" },
      nix = { "nixpkgs_fmt" },

      -- Shell/Config
      bash = { "shfmt" },
      sh = { "shfmt" },
      zsh = { "shfmt" },

      c = { "clang_format" },
      cpp = { "clang_format" },
      cs = { "csharpier" },

      toml = { "taplo" },
      sql = { "sqlfluff" },

      elixir = { "mix" },
      haskell = { "fourmolu", "ormolu" },
      zig = { "zigfmt" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--prose-wrap", "always", "--print-width", "80" },
      },
      ruff_format = {
        command = "ruff",
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
      },
      ruff_fix = {
        command = "ruff",
        args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
      },
      yamlfmt = {
        command = "yamlfmt",
        args = { "-in", "-formatter", "retain_line_breaks=true" },
      },
      nixpkgs_fmt = {
        command = "nixpkgs-fmt",
      },
      shfmt = {
        prepend_args = { "-i", "2", "-ci" }, -- 2 space indent, case indent
      },
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      sqlfluff = {
        command = "sqlfluff",
        args = { "format", "--dialect=ansi", "-" },
      },
      taplo = {
        command = "taplo",
        args = { "format", "-" },
      },
      csharpier = {
        command = "dotnet",
        args = { "csharpier", "--write-stdout" },
      },
    },
  },
}
