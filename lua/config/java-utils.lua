-- config/java-utils.lua

local M = {}

-- Run current Java file in the terminal (no split)
function M.run_current_java_file()
  local file = vim.fn.expand("%:p")          -- full path to file
  local dir = vim.fn.expand("%:p:h")         -- file directory
  local classname = vim.fn.expand("%:t:r")   -- filename without extension

  -- Find existing terminal buffer if available
  local term_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_get_name(buf):match("term://.*") then
      term_buf = buf
      break
    end
  end

  -- Create or switch to terminal
  if not term_buf then
    vim.cmd("terminal")
  else
    vim.cmd("buffer " .. term_buf)
  end

  -- Send commands to terminal
  vim.fn.chansend(vim.b.terminal_job_id, {
    "clear",
    "cd " .. dir,
    "javac " .. file,
    "java " .. classname,
    ""
  })
end

return M

