
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional but recommended
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header: keep it understated
    dashboard.section.header.val = {
      " ",
      "     aleph / nvim",
      " ",
    }

    -- Buttons (use Telescope you already have)
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("n", "  New file", "<cmd>ene | startinsert<CR>"),
      dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
    }

    -- Footer: quiet, non-motivational
    dashboard.section.footer.val = "A quiet start."

    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)

    -- If Neovim opens with Lazy UI first, close it and show Alpha
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        if vim.bo.filetype == "alpha" then
          vim.cmd("AlphaRedraw")
        end
      end,
    })
  end,
}
