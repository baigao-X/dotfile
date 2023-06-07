return {
    {
        "akinsho/bufferline.nvim",
        keys = {
            { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
            { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
            { "<leader>1",  "<Cmd>BufferLineGoToBuffer 1<CR>",         desc = "GotoBuffer 1" },
            { "<leader>2",  "<Cmd>BufferLineGoToBuffer 2<CR>",         desc = "GotoBuffer 2" },
            { "<leader>3",  "<Cmd>BufferLineGoToBuffer 3<CR>",         desc = "GotoBuffer 3" },
            { "<leader>4",  "<Cmd>BufferLineGoToBuffer 4<CR>",         desc = "GotoBuffer 4" },
            { "<leader>5",  "<Cmd>BufferLineGoToBuffer 5<CR>",         desc = "GotoBuffer 5" },
            { "<leader>6",  "<Cmd>BufferLineGoToBuffer 6<CR>",         desc = "GotoBuffer 6" },
            { "<leader>7",  "<Cmd>BufferLineGoToBuffer 7<CR>",         desc = "GotoBuffer 7" },
            { "<leader>8",  "<Cmd>BufferLineGoToBuffer 8<CR>",         desc = "GotoBuffer 8" },
            { "<leader>9",  "<Cmd>BufferLineGoToBuffer 9<CR>",         desc = "GotoBuffer 9" },
        },
        opts = {
            options = {
                always_show_bufferline = true,
                numbers = "ordinal",
            },
        },
    }
}
