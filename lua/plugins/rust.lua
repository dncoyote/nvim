-- lua/plugins/rust.lua
return {
  ---------------------------------------------------------------------------
  -- First-class Rust LSP + tools + DAP glue
  ---------------------------------------------------------------------------
  {
    "mrcjkb/rustaceanvim",
    version = "^5",              -- track stable API
    ft = { "rust" },             -- lazy-load on Rust buffers
    config = function()
      -- Resolve codelldb installed by Mason (macOS/aarch64-safe)
      local function codelldb_adapter()
        local ok, mr = pcall(require, "mason-registry")
        if not ok then return nil end
        if not mr.is_installed("codelldb") then return nil end
        local pkg = mr.get_package("codelldb")
        local root = pkg:get_install_path()
        local codelldb = root .. "/extension/adapter/codelldb"
        local liblldb = root .. "/extension/lldb/lib/liblldb.dylib"
        local cfg = require("rustaceanvim.config")
        return cfg.get_codelldb_adapter(codelldb, liblldb)
      end

      -- If you already expose cmp capabilities elsewhere, reuse them
      local capabilities = nil
      pcall(function()
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end)

      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { replace_builtin_hover = true },
          float_win_config = { border = "rounded" },
        },
        server = {
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            local map = function(lhs, rhs, desc)
              vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
            end
            map("K", "<cmd>RustLsp hover actions<cr>", "Rust Hover")
            map("<leader>ca", "<cmd>RustLsp codeAction<cr>", "Rust Code Action")
            map("<leader>cr", "<cmd>RustLsp runnables<cr>", "Rust Runnables")
            map("<leader>cd", "<cmd>RustLsp debuggables<cr>", "Rust Debuggables")

            -- Format on save through rust-analyzer (rustfmt)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format({ async = false }) end,
            })
          end,
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              check = { command = "clippy" }, -- run Clippy on save
              diagnostics = { enable = true },
              inlayHints = {
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints  = { enable = "always" },
                bindingModeHints      = { enable = true },
                expressionAdjustmentHints = { enable = "always" },
              },
            },
          },
        },
        dap = { adapter = codelldb_adapter() }, -- nil → prompts to install
      }
    end,
  },

  ---------------------------------------------------------------------------
  -- Cargo.toml helper: versions, features, docs, cmp integration
  ---------------------------------------------------------------------------
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup({
        completion = { cmp = { enabled = true } },
        lsp = { enabled = true },
        popup = { border = "rounded" },
      })
    end,
  },
}
