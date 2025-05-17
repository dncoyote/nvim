return {
  "kdheepak/lazygit.nvim",
  config = function()
    -- Keymap for opening LazyGit with <leader>lg
    vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = "LazyGit" })
    
    -- Optional: Customize LazyGit further if desired
    vim.g.lazygit_floating_window = true  -- Use floating window for LazyGit
  end
}
