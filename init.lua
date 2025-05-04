-- Basic Settings (editor UI & behavior)
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")           -- show absolute line numbers
--vim.cmd("set relativenumber")   -- show relative numbers (optional, for faster movements)

-- Enable true colors (important for good colors)
vim.opt.termguicolors = true

vim.cmd([[
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal linebreak
  autocmd FileType markdown setlocal spell spelllang=en_us
]])


vim.g.mapleader = " "

-- Compile and Run Java smartly
--vim.api.nvim_create_user_command('RunJava', function()
--  local filename = vim.fn.expand('%')
--  local class = string.gsub(vim.fn.expand('%:r'), '/', '.')
--  vim.cmd('!mkdir -p out && javac -d out ' .. filename .. ' && java -cp out ' .. class)
--end, {})

-- Key mapping: <leader>r to RunJava
--vim.keymap.set('n', '<leader>r', ':RunJava<CR>') 

-- 1. Bootstrap Lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins", {})
-- 2. Plugin List
local plugins = {
  --Java LSP
--  {
--  "neovim/nvim-lspconfig",
--  config = function()
--    require('lspconfig').jdtls.setup{}
--  end
--},
}
-- 3. Lazy Setup
--require("lazy").setup(plugins, {})

-- Java keymaps
vim.keymap.set("n", "<leader>jc", ":!javac %<CR>", { desc = "Compile Java" })
vim.keymap.set("n", "<leader>jr", ":!java %:r<CR>", { desc = "Run Java" })

-- Markdown keymaps
--vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = "LazyGit" })
