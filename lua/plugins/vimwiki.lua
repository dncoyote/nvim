return {
  "vimwiki/vimwiki",
  event = "VeryLazy",
  init = function()
    -- Main wiki now lives inside ~/Notes/wiki
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
    vim.opt_local.conceallevel = 2
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"

    -- Ensure Enter/Backspace follow/go back in Vimwiki (without touching global maps)
    vim.keymap.set("n", "<CR>", "<Plug>VimwikiFollowLink", { buffer = true, silent = true })
    vim.keymap.set("n", "<BS>", "<Plug>VimwikiGoBackLink", { buffer = true, silent = true })

    require("core.markdown-keymaps").setup_bufmaps(0)
  end,
}
