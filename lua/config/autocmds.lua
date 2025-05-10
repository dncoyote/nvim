-- Auto-start JDTLS only for Java files
vim.cmd [[
  augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'config.jdtls'.setup_jdtls()
  augroup end
]]

-- Enable word-wrap and linebreak only for prose-oriented filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
  desc = "Enable word-wrap and soft line breaks for writing files",
})

