return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl", -- for v3+ version
  opts = {
    indent = { char = "│" }, -- or "▏", "┊", "⎸"
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = { "help", "terminal", "dashboard", "lazy", "NvimTree", "neo-tree", "Trouble" },
      buftypes = { "terminal", "nofile" },
    },
  },
}

