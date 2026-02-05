return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    cmd = { "MarkdownPreview" },
    config = function()
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Preview Markdown" })
    end,
  },

  -- Render markdown *inside* nvim (always-on by default)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "vimwiki" }, -- add more if you want (e.g. "quarto")
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons", -- or mini.icons if you prefer
    },
    ---@module "render-markdown"
    opts = {
      enabled = true, -- render by default :contentReference[oaicite:1]{index=1}
      -- file_types is optional if you already use ft= in lazy spec,
      -- but it's fine to be explicit:
      file_types = { "markdown", "vimwiki" }, -- :contentReference[oaicite:2]{index=2}
    },
  },

  {
    "junegunn/goyo.vim",
    config = function()
      vim.keymap.set("n", "<leader>mz", ":Goyo<CR>", { desc = "Zen Mode" })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
}
