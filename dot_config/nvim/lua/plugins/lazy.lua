return {
  -- { "atmosuwiryo/vim-winteriscoming" },

  -- {
  --   "atmosuwiryo/vim-winteriscoming",
  --   config = function()
  --     vim.cmd("colorscheme WinterIsComing-dark-blue-color-theme")
  --   end
  -- },
  -- nixos doesn't support mason
  { "williamboman/mason.nvim",           enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim",       enabled = false },
  { "windwp/nvim-autopairs",             enabled = false },
  { "windwp/nvim-ts-autotag",            enabled = false },
  { "catppuccin/nvim",                   name = "catppuccin", enabled = false },
}
