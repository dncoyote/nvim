-- lua/core/markdown-keymaps.lua
-- Buffer-local helpers + keymaps for markdown/vimwiki note-taking

local M = {}

-- Insert a line above/below with provided text, keep cursor sensible
local function insert_line(text, where)
  local row = vim.api.nvim_win_get_cursor(0)[1]
  if where == "above" then
    vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { text })
    vim.api.nvim_win_set_cursor(0, { row, 0 })
  else
    vim.api.nvim_buf_set_lines(0, row, row, false, { text })
    vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
  end
end

-- Surround current line (or visual selection) with fences
local function fenced_block()
  local lang = vim.fn.input("Code language (e.g. bash, js, java): ")
  if vim.fn.mode():match("[Vv]") then
    -- Visual mode: wrap selection
    local _, lsrow, lscol = unpack(vim.fn.getpos("'<"))
    local _, lerow, lecol = unpack(vim.fn.getpos("'>"))
    lsrow, lerow = lsrow - 1, lerow -- 0-index start, end is exclusive in set_lines
    local top = "```" .. (lang or "")
    local bot = "```"
    local lines = vim.api.nvim_buf_get_lines(0, lsrow, lerow, false)
    table.insert(lines, 1, top)
    table.insert(lines, bot)
    vim.api.nvim_buf_set_lines(0, lsrow, lerow, false, lines)
  else
    -- Normal mode: insert template below
    insert_line("```" .. (lang or ""), "below")
    insert_line("```", "below")
    vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1] - 1, 0 })
  end
end

-- Heading helpers: make "#", "##", ..., "# Heading"
local function set_heading(level)
  local hashes = string.rep("#", level) .. " "
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
  -- If line already starts with hashes, replace; else prefix
  local new = line:gsub("^#+%s*", "")
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { hashes .. new })
  -- move cursor to end-of-line
  local col = #hashes + #new
  vim.api.nvim_win_set_cursor(0, { row, col })
end

-- Insert a simple checkbox line or toggle current checkbox
local function insert_checkbox()
  insert_line("- [ ] ", "below")
end

local function toggle_checkbox()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
  if line:match("^%s*%- %[%s%]") then
    line = line:gsub("^%s*%- %[%s%]", "- [x]")
  elseif line:match("^%s*%- %[x%]") then
    line = line:gsub("^%s*%- %[x%]", "- [-]")
  elseif line:match("^%s*%- %[%-%]") then
    line = line:gsub("^%s*%- %[%-%]", "- [ ]")
  else
    -- If not a checkbox, turn it into an empty checkbox
    if line:match("^%s*%- ") then
      line = line:gsub("^%s*%- ", "- [ ] ")
    else
      line = "- [ ] " .. line
    end
  end
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line })
end

-- Blockquote
local function blockquote()
  insert_line("> ", "below")
end

-- Quick link/image templates
local function insert_link()
  local text = vim.fn.input("Link text: ")
  local url  = vim.fn.input("URL (or wiki page): ")
  local s    = ""
  if url:match("^%[%[.*%]%]") then
    -- user typed a wiki link; use as-is
    s = url
  elseif url ~= "" then
    s = string.format("[%s](%s)", text ~= "" and text or url, url)
  else
    s = string.format("[[%s]]", text ~= "" and text or "link")
  end
  insert_line(s, "below")
end

local function insert_image()
  local alt = vim.fn.input("Image alt text: ")
  local src = vim.fn.input("Image path/URL: ")
  local s = string.format("![%s](%s)", alt ~= "" and alt or "image", src)
  insert_line(s, "below")
end

-- Minimal table scaffold
local function insert_table()
  local cols = tonumber(vim.fn.input("Columns (2-6): ")) or 3
  cols = math.max(2, math.min(cols, 6))
  local header = {}
  for i = 1, cols do header[i] = "Header" .. i end
  local sep = {}
  for i = 1, cols do sep[i] = "---" end
  local row = {}
  for i = 1, cols do row[i] = "cell" .. i end
  insert_line("| " .. table.concat(header, " | ") .. " |", "below")
  insert_line("| " .. table.concat(sep, " | ") .. " |", "below")
  insert_line("| " .. table.concat(row, " | ") .. " |", "below")
end

-- Date / Time stamps
local function insert_date()
  insert_line(os.date("> %Y-%m-%d (%a)"), "below")
end

local function insert_datetime()
  insert_line(os.date("> %Y-%m-%d %H:%M (%a)"), "below")
end

-- Callouts (works fine in many MD renderers)
local function callout(kind)
  kind = kind or "note"
  local upper = kind:upper()
  local lines = {
    string.format("> [!%s] %s", upper, upper:sub(1, 1) .. string.lower(upper:sub(2))),
    "> ",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  vim.api.nvim_win_set_cursor(0, { row + 2, 2 })
end

function M.setup_bufmaps(bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  -- Headings
  map("n", "<leader>h1", function() set_heading(1) end, "H1")
  map("n", "<leader>h2", function() set_heading(2) end, "H2")
  map("n", "<leader>h3", function() set_heading(3) end, "H3")
  map("n", "<leader>h4", function() set_heading(4) end, "H4")
  map("n", "<leader>h5", function() set_heading(5) end, "H5")
  map("n", "<leader>h6", function() set_heading(6) end, "H6")

  -- Checkboxes
  map("n", "<leader>c", insert_checkbox, "Insert checkbox below")
  map("n", "<leader>xt", toggle_checkbox, "Toggle checkbox on line")

  -- Blocks
  map({ "n", "v" }, "<leader>cb", fenced_block, "Code block (fenced)")
  map("n", "<leader>bq", blockquote, "Blockquote below")
  map("n", "<leader>tbl", insert_table, "Insert 3x table")
  map("n", "<leader>lnk", insert_link, "Insert link")
  map("n", "<leader>img", insert_image, "Insert image")

  -- Callouts
  map("n", "<leader>ca", function() callout(vim.fn.input("Callout (note/tip/warn): ")) end, "Callout")

  -- Timestamps
  map("n", "<leader>dt", insert_date, "Insert date")
  map("n", "<leader>tm", insert_datetime, "Insert datetime")

-- Insert READ–THINK–ACT chapter template
map("n", "<leader>rt", function()
  local lines = {
    "## Chapter  ",
    "### READ — THINK",
    "> ",
    "",
    "### ACT ",
    "#### Actionable Items ",
    "- [ ] ",
    "#### Habits / Systems to try",
    "- [ ] ",
    "",
    "#### To Explore ",
    "- [ ] ",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row, row, false, lines)
  -- move cursor to the quote block for immediate typing
  vim.api.nvim_win_set_cursor(0, { row + 2, 3 })
end, "Insert READ–THINK–ACT block")

end
return M
