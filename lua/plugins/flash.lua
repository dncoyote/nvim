return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- Keep it calm: don't take over your editor aggressively
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      -- This keeps searches consistent and avoids “magic” behavior
      multi_window = true,
      forward = true,
      wrap = true,
      incremental = true,
    },
    jump = {
      autojump = false, -- require explicit choice (less surprising)
    },
    modes = {
      -- We will NOT override your default `s` unless you want it
      -- char mode is useful, but can be too invasive if bound globally
      char = { enabled = true },
    },
  },
  keys = {
    -- Main: jump anywhere (like a smarter, calmer “easymotion”)
    {
      "gs",
      function()
        require("flash").jump()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash: Jump",
    },

    -- Treesitter-powered jump (excellent for code structure)
    {
      "gS",
      function()
        require("flash").treesitter()
      end,
      mode = { "n", "x", "o" },
      desc = "Flash: Treesitter jump",
    },

    -- Remote flash: operate across windows (great in splits)
    {
      "gr",
      function()
        require("flash").remote()
      end,
      mode = "o",
      desc = "Flash: Remote",
    },

    -- Search-based jump (useful when you already started `/`)
    {
      "g/",
      function()
        require("flash").jump({ search = { mode = "search" } })
      end,
      mode = { "n", "o", "x" },
      desc = "Flash: Jump from search",
    },

    -- Optional: integrate with Telescope prompt (`<c-s>`)
    {
      "<c-s>",
      function()
        require("flash").jump({
          pattern = "^",
          label = { after = { 0, 0 } },
          search = { mode = "search", max_length = 0 },
          action = function(match, state)
            state:hide()
            vim.api.nvim_win_set_cursor(0, match.pos)
          end,
        })
      end,
      mode = "c",
      desc = "Flash: Jump (cmdline)",
    },
  },
}

