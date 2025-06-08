return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
      yaml = { "prettier" },
      python = { "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--prose-wrap", "always", "--print-width", "80" },
      },
    },
  },
}
