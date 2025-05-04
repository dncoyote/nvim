return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", {desc = "Toggle [E]xplorer"})
        require("nvim-tree").setup({
            hijack_netrw = true,
            auto_reload_on_write = true,
            filters = {
                dotfiles = false, -- ← this shows .env, .gitignore, etc.
                custom = {},
            },
            git = {
                enable = true,
                ignore = false,
            },
        })
    end
}
