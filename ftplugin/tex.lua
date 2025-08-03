-- ~/.config/nvim/ftplugin/tex.lua
-- only load once
if vim.g.loaded_vimtex_ft then return end
vim.g.loaded_vimtex_ft = true

-- Enable syntax folding
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr   = "vimtex#fold#expr()"
vim.opt_local.textwidth  = 80
vim.opt_local.wrap       = true            -- soft wrap visually
vim.opt_local.linebreak  = true            -- wrap at word boundaries
vim.opt_local.breakindent = true           -- indent wrapped lines
-- Compile & view mappings (inoremap / nnoremap use <localleader> by convention)
local opts = { buffer = true, silent = true }
-- Instead of <localleader>, use <leader>lX (group LaTeX actions under "l")
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", opts)
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>",    opts)
vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>",    opts)
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>",  opts)
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>",   opts)
