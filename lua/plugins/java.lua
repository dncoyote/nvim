return{
  "neovim/nvim-lspconfig",
  config = function()
    require('lspconfig').jdtls.setup{}
--    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
--    vim.keymap.set('n', '<leader>fg', builtin.live_grep,{})
  end
}
