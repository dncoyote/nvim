-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
  "lervag/vimtex",
  config = function()
    -- Use latexmk for compilation:
    vim.g.vimtex_compiler_method      = "latexmk"
    -- Don’t open the quickfix window on errors:
    vim.g.vimtex_quickfix_mode        = 0
    -- Use the system PDF viewer (Preview.app) via `open`:
    -- vim.g.vimtex_view_method     = "zathura"  -- we’ll override this below
    vim.g.vimtex_view_method          = "skim"
    vim.g.vimtex_view_skim_sync       = 1
    vim.g.vimtex_view_skim_activate   = 1
    -- If you prefer Preview.app on macOS:
    vim.g.vimtex_view_general_viewer  = "open"
    vim.g.vimtex_view_general_options = [[--reuse-instance]]
  end
}
