return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- file icons
  },
  config = function()
    -- Keymap to toggle the file explorer
    vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })

    require("nvim-tree").setup({
      hijack_netrw = true,
      auto_reload_on_write = true,
      --open_on_setup = true,
      filters = {
        dotfiles = false, -- Show dotfiles like .env, .gitignore
        custom = {},
      },
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
      },
    })
  end,
}

