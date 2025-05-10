-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

vim.api.nvim_create_user_command("JavaQuickRun", function()
  require("config.java-utils").run_current_java_file()
end, { desc = "Run current Java file" })

-- Buffer management
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "[B]uffer [D]elete" })

-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer (tab-style)" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer (tab-style)" })
vim.keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "[B]uffer [C]lose current" })



vim.keymap.set("n", "<leader>jr", ":JavaQuickRun<CR>", { desc = "[J]ava [R]un file" })
-- vim.keymap.set("n", "<leader>jr", function()
--   -- Stop all LSP clients (safe for single-file or Java-only sessions)
--   for _, client in pairs(vim.lsp.get_active_clients()) do
--     client.stop()
--   end
--
--   -- Reload current buffer to trigger LSP reattach
--   vim.cmd("edit")
-- end, { desc = "[J]ava LSP [R]estart and Reload" })
--
-- vim.keymap.set("n", "<leader>jr", function()
--   -- Stop Java-related LSPs
--   for _, client in pairs(vim.lsp.get_active_clients()) do
--     if client.name == "jdtls" then
--       client.stop()
--     end
--   end
--
--   -- Reopen the file *after* a short delay to allow LSP to reinitialize
--   vim.defer_fn(function()
--     vim.cmd("edit")
--   end, 200)  -- delay in milliseconds
-- end, { desc = "[J]ava LSP [R]estart and Reload" })
--
