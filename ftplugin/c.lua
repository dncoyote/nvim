local dap = require("dap")

-- Reuse the CodeLLDB installation managed by Mason.
local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

if vim.fn.executable(codelldb) ~= 1 then
    vim.notify("CodeLLDB not found", vim.log.levels.WARN)
    return
end

dap.adapters.codelldb = {
    type = "executable",
    command = codelldb,
}

dap.configurations.c = {
    {
        name = "Debug C executable",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}
