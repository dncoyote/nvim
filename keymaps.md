#  Keymaps and Their Uses


# Neovim Keymaps Cheat Sheet

## General Editing
- `<leader>wq` — Save and quit
- `<leader>qq` — Quit without saving
- `<leader>ww` — Save current buffer
- `gx` — Open URL under cursor

## Window Management
- `<leader>sv` — Split window vertically
- `<leader>sh` — Split window horizontally
- `<leader>se` — Make splits equal size
- `<leader>sx` — Close current split
- `<leader>sj` — Decrease split height
- `<leader>sk` — Increase split height
- `<leader>sl` — Increase split width
- `<leader>sh` — Decrease split width (conflicts with split horizontal; consider remapping)

## Tab Management
- `<leader>to` — Open new tab
- `<leader>tx` — Close current tab
- `<leader>tn` — Next tab
- `<leader>tp` — Previous tab

## Diff and Quickfix
- `<leader>cc` — Put diff from current
- `<leader>cj` — Get diff from left (local)
- `<leader>ck` — Get diff from right (remote)
- `<leader>cn` — Next diff hunk
- `<leader>cp` — Previous diff hunk
- `<leader>qo` — Open quickfix list
- `<leader>qf` — Jump to first quickfix item
- `<leader>qn` — Next quickfix item
- `<leader>qp` — Previous quickfix item
- `<leader>ql` — Last quickfix item
- `<leader>qc` — Close quickfix list

## File Explorer (nvim-tree)
- `<leader>ee` — Toggle file explorer
- `<leader>er` — Focus file explorer
- `<leader>ef` — Find current file in explorer

## Telescope
- `<leader>ff` — Find files in project
- `<leader>fg` — Live grep in project
- `<leader>fb` — Find open buffers
- `<leader>fh` — Help tags
- `<leader>fs` — Fuzzy find in current buffer
- `<leader>fo` — LSP document symbols
- `<leader>fi` — LSP incoming calls
- `<leader>fm` — Fuzzy find methods in current class
- `<leader>ft` — Grep in current NvimTree node folder

## Git & Harpoon
- `<leader>gb` — Toggle git blame
- `<S-m>` — Mark file with Harpoon
- `<TAB>` — Toggle Harpoon menu
- `<leader>h1`..`<leader>h9` — Jump to harpoon marks 1 to 9

## Debugging (DAP)
- `<leader>bb` — Toggle breakpoint
- `<leader>bc` — Set conditional breakpoint
- `<leader>bl` — Set logpoint
- `<leader>br` — Clear all breakpoints
- `<leader>dc` — Continue debugging
- `<leader>dj` — Step over
- `<leader>dk` — Step into
- `<leader>do` — Step out
- `<leader>dr` — Toggle REPL
- `<leader>dl` — Run last debug session
- `<leader>dd` — Disconnect and close DAP UI

## LSP
- `<leader>gg` — Hover documentation
- `<leader>gd` — Go to definition
- `<leader>gD` — Go to declaration
- `<leader>gi` — Go to implementation
- `<leader>gt` — Go to type definition
- `<leader>gr` — List references
- `<leader>gs` — Signature help
- `<leader>rr` — Rename symbol
- `<leader>gf` — Format buffer (async)
- `<leader>ga` — Code actions
- `<leader>gl` — Open diagnostics float
- `<leader>gp` — Previous diagnostic
- `<leader>gn` — Next diagnostic
- `<leader>tr` — Document symbols
- `<C-Space>` — Trigger completion (insert mode)

## Spring Boot Plugin
- `<leader>Jr` — Run Spring Boot project
- `<leader>Jc` — Generate class
- `<leader>Ji` — Generate interface
- `<leader>Je` — Generate enum

## REST Client
- `<leader>xr` — Run REST query

## Maximize Window
- `<leader>sm` — Toggle maximize window

