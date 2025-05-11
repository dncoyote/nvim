return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", -- or "tabs"
          separator_style = "slant", -- | "thick" | "thin" | { 'left', 'right' }
          diagnostics = "nvim_lsp",
          show_close_icon = false,
          show_buffer_close_icons = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true,
            },
          },
        },
      })
    end,
  },
}

