return {
  "augmentcode/augment.vim",
  config = function()
    vim.keymap.set("n", "<leader>Q", ":Aug chat<CR>", { noremap = true, silent = true })
    vim.g.augment_workspace_folders = { vim.fn.getcwd() }
  end,
}
