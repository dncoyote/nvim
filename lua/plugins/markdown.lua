return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    cmd = { "MarkdownPreview" },
    dev = false,
    pin = false,
    version = false,
    config = function()
      vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = "Preview Markdown" })
    end,
  },
  {
    "junegunn/goyo.vim",
    config = function()
      vim.keymap.set('n', '<leader>mz', ':Goyo<CR>', { desc = "Zen Mode" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
}

