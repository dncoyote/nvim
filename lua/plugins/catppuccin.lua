return {
  "catppuccin/nvim",
 lazy = false,
 name = "catppuccin",
 priority = 1000,
 config = function()
   require("catppuccin").setup({
   flavour = "mocha", -- Choose: mocha, macchiato, frappe, latte
     background = { dark = "mocha", light = "latte" },
     transparent_background = false,
    term_colors = true,
   })
   vim.cmd.colorscheme "catppuccin"
end
}
--
-- return{
--   "sainnhe/sonokai",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.g.sonokai_style = 'andromeda',
--     vim.cmd.colorscheme "sonokai"
--   end
-- }

--return {
-- Add this to your plugins list

--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.cmd.colorscheme "tokyonight-night"
--  end

--}
