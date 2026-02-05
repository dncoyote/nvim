-- lua/core/java-keymaps.lua
-- Java helpers: copy relative path / package / FQN to clipboard

local M = {}

local function notify(msg)
  vim.notify(msg, vim.log.levels.INFO, { title = "Java Helpers" })
end

local function buf_path()
  local p = vim.api.nvim_buf_get_name(0)
  if p == nil or p == "" then return nil end
  return vim.fs.normalize(p)
end

-- Try to find a sensible project root.
-- Priority: .git, Maven/Gradle wrappers/files.
local function project_root()
  local p = buf_path()
  if not p then return vim.loop.cwd() end
  local dir = vim.fs.dirname(p)

  -- Neovim 0.10+: vim.fs.root
  local root = vim.fs.root(dir, { ".git", "pom.xml", "mvnw", "build.gradle", "settings.gradle", "gradlew" })
  return root or vim.loop.cwd()
end

local function relative_to_root(abs, root)
  abs = vim.fs.normalize(abs)
  root = vim.fs.normalize(root)

  -- Ensure root ends with path separator for clean prefix match
  local prefix = root
  if prefix:sub(-1) ~= "/" then prefix = prefix .. "/" end

  if abs:sub(1, #prefix) == prefix then
    return abs:sub(#prefix + 1)
  end
  -- Fallback: relative to current working dir
  return vim.fn.fnamemodify(abs, ":.")
end

local function set_clipboard(text, label)
  vim.fn.setreg("+", text)
  vim.fn.setreg('"', text)
  notify(string.format("%s copied: %s", label, text))
end

local function read_package_declaration(max_lines)
  max_lines = max_lines or 120
  local lines = vim.api.nvim_buf_get_lines(0, 0, max_lines, false)
  for _, line in ipairs(lines) do
    -- matches: package com.foo.bar;
    local pkg = line:match("^%s*package%s+([%w%._]+)%s*;%s*$")
    if pkg then return pkg end
  end
  return nil
end

local function class_name_from_file()
  local p = buf_path()
  if not p then return nil end
  local name = vim.fs.basename(p)
  return name:gsub("%.java$", "")
end

-- Derive package from conventional source roots if package line isn't present
local function derive_package_from_path(relpath)
  -- Handles:
  -- src/main/java/com/foo/Bar.java -> com.foo
  -- src/test/java/com/foo/BarTest.java -> com.foo
  local marker_main = "src/main/java/"
  local marker_test = "src/test/java/"

  local idx = relpath:find(marker_main, 1, true)
  local marker = marker_main
  if not idx then
    idx = relpath:find(marker_test, 1, true)
    marker = marker_test
  end
  if not idx then return nil end

  local after = relpath:sub(idx + #marker)
  local dir = vim.fs.dirname(after)
  if not dir or dir == "." then return "" end
  return (dir:gsub("/", "."))
end

local function get_package_and_fqn()
  local abs = buf_path()
  if not abs then return nil, nil end

  local root = project_root()
  local rel = relative_to_root(abs, root)

  local pkg = read_package_declaration()
  if not pkg then
    pkg = derive_package_from_path(rel)
  end

  local cls = class_name_from_file()
  if not cls then return pkg, nil end

  if pkg and pkg ~= "" then
    return pkg, (pkg .. "." .. cls)
  end
  return pkg, cls
end

function M.setup_bufmaps(bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  map("n", "<leader>jr", function()
    local abs = buf_path()
    if not abs then return end
    local rel = relative_to_root(abs, project_root())
    set_clipboard(rel, "Relative path")
  end, "Java: copy relative path from project root")

  map("n", "<leader>jp", function()
    local pkg = read_package_declaration() or derive_package_from_path(relative_to_root(buf_path(), project_root()))
    set_clipboard(pkg or "", "Package")
  end, "Java: copy package")

  map("n", "<leader>jf", function()
    local _, fqn = get_package_and_fqn()
    set_clipboard(fqn or "", "FQN")
  end, "Java: copy fully qualified class name")

  -- Optional “quality of life”: copy exact commands you can paste into tmux
  map("n", "<leader>jc", function()
    local abs = buf_path()
    if not abs then return end
    local rel = relative_to_root(abs, project_root())
    set_clipboard(("javac %q"):format(rel), "javac command")
  end, "Java: copy javac command")

  map("n", "<leader>jx", function()
    local _, fqn = get_package_and_fqn()
    if not fqn or fqn == "" then
      notify("Could not determine FQN (missing package + non-standard path).")
      return
    end
    set_clipboard(("java %s"):format(fqn), "java command")
  end, "Java: copy java command")
end

return M
