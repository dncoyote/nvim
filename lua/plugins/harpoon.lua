-- List of favorite files/marks per project
return {
  -- https://github.com/ThePrimeagen/harpoon
  'ThePrimeagen/harpoon',
  branch = 'master',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
  },
  opts = {
    menu = {
      width = 120
    }
  },
  config = function()
        -- Set a vim motion to <Shift>m to mark a file with harpoon
        vim.keymap.set("n", "<s-m>", "<cmd>lua require('harpoon.mark').add_file()<cr>", {desc = "Harpoon Mark File"})
        -- Set a vim motion to the tab key to open the harpoon menu to easily navigate frequented files
        vim.keymap.set("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = "Harpoon Toggle Menu"})
    end
}

