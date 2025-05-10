return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local which_key = require('which-key')

    which_key.setup()

    which_key.register({
      ["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Toggle Comment" },

      ["<leader>c"] = {
        name = "[C]ode",
        h = { vim.lsp.buf.hover, "Hover Documentation" },
        d = { vim.lsp.buf.definition, "Go to Definition" },
        D = { vim.lsp.buf.declaration, "Go to Declaration" },
        a = { vim.lsp.buf.code_action, "Code Actions" },
        r = { require("telescope.builtin").lsp_references, "Find References" },
        i = { require("telescope.builtin").lsp_implementations, "Go to Implementation" },
        R = { vim.lsp.buf.rename, "Rename Symbol" },
        f = { vim.lsp.buf.format, "Format File" },
      },

      ["<leader>lr"] = { ":LspRestartAll<CR>", "Restart All LSPs" },
      ["<leader>jR"] = { ":JdtRestart<CR>", "Restart JDTLS" },

      ["<leader>d"] = {
        name = "[D]ebug",
        t = { require("dap").toggle_breakpoint, "Toggle Breakpoint" },
        s = { require("dap").continue, "Start Debugger" },
        c = { require("dapui").close, "Close Debugger UI" },
      },

      ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "[E]xplorer Toggle" },

      ["<leader>f"] = {
        name = "[F]ind",
        f = { require("telescope.builtin").find_files, "Find Files" },
        g = { require("telescope.builtin").live_grep, "Live Grep" },
        d = { require("telescope.builtin").diagnostics, "Find Diagnostics" },
        r = { require("telescope.builtin").resume, "Resume Search" },
        ["."] = { require("telescope.builtin").oldfiles, "Recent Files" },
        b = { require("telescope.builtin").buffers, "Open Buffers" },
      },

      ["<leader>g"] = {
        name = "[G]it",
        h = { ":Gitsigns preview_hunk<CR>", "Preview Hunk" },
        b = { ":Git blame<CR>", "Git Blame" },
        a = { ":Git add %<CR>", "Add Current File" },
        A = { ":Git add .<CR>", "Add All Files" },
        c = { ":Git commit<CR>", "Commit Changes" },
        p = { ":Git push<CR>", "Push Changes" },
      },

      ["<leader>lg"] = { ":LazyGit<CR>", "LazyGit" },

      ["<leader>w"] = {
        name = "[W]indow",
        v = { ":vsplit<CR>", "Vertical Split" },
        h = { ":split<CR>", "Horizontal Split" },
      },

      ["<leader>b"] = {
        name = "[B]uffer",
        n = { ":bnext<CR>", "Next Buffer" },
        p = { ":bprevious<CR>", "Previous Buffer" },
        d = { ":bd<CR>", "Delete Buffer" },
      },

      ["<leader>t"] = {
        name = "[T]oggle",
        w = { ":set wrap!<CR>", "Toggle Wrap" },
        n = { ":set number! relativenumber!<CR>", "Toggle Line Numbers" },
      },

      ["<leader>J"] = {
        name = "[J]ava",
        r = { function() require("springboot-nvim").boot_run() end, "Run Spring Boot App" },
        c = { function() require("springboot-nvim").generate_class() end, "Generate Class" },
        i = { function() require("springboot-nvim").generate_interface() end, "Generate Interface" },
        e = { function() require("springboot-nvim").generate_enum() end, "Generate Enum" },
      },

      ["<leader>m"] = {
        name = "[M]arkdown",
        p = { ":MarkdownPreview<CR>", "Markdown Preview" },
        z = { ":Goyo<CR>", "Zen Mode" },
      },
    })
  end
}
