return {
  "vimwiki/vimwiki",
  ft = { "vimwiki" }, -- load when vimwiki buffers open (NOT VeryLazy)
  init = function()
    -- Only globals here (safe before plugin loads)
    vim.g.vimwiki_list = { {
      path = os.getenv("HOME") .. "/Notes/wiki",
      syntax = "markdown",
      ext = ".md",
      diary_rel_path = "journal",
      diary_index = "Journal",
      auto_toc = 1,
      auto_tags = 1,
      auto_generate_links = 1,
      template_path = os.getenv("HOME") .. "/Notes/wiki/templates",
      template_default = "default",
      template_ext = ".tpl",
    } }

    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_auto_header = 1

    -- Buffer-local behavior must be applied per-buffer
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "vimwiki" },
      callback = function(ev)
        local opt = vim.opt_local
        opt.conceallevel = 2
        opt.wrap = true
        opt.linebreak = true
        opt.spell = true
        opt.spelllang = "en"

        -- Vimwiki navigation (buffer-local)
        vim.keymap.set("n", "<CR>", "<Plug>VimwikiFollowLink", { buffer = ev.buf, silent = true })
        vim.keymap.set("n", "<BS>", "<Plug>VimwikiGoBackLink", { buffer = ev.buf, silent = true })

        -- Your markdown helpers (buffer-local)
        require("core.markdown-keymaps").setup_bufmaps(ev.buf)
      end,
    })
  end,
}
