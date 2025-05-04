return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Set the keymap to toggle Neo-tree
    vim.keymap.set('n', '<leader>n', ':Neotree toggle left<CR>')

    -- Add Neo-tree configuration to show hidden files
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,  -- Show hidden files (dotfiles)
          hide_gitignored = false,  -- Optionally ensure gitignored files are also visible
          hide_by_name = { ".git", "node_modules" },  -- Example of specific items to hide
        }
      }
    })
  end
}
