-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
    name = "c/cpp build",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        if vim.bo.filetype == "cpp" then
            cmd = "g++"
        elseif vim.bo.filetype == "c" then
            cmd = "gcc"
        end
        return {
            cmd = cmd,
            args = { file },
            components = { { "on_output_quickfix", open = true }, "default" },
        }
    end,
    condition = {
        filetype = { "c", "cpp" },
    },
}
