return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        opts = {
            window = {
                mappings = {
                    ["<space>"] = "none",
                    ["h"]       = "navigate_up",
                    ["l"]       = "open",
                    ["L"]       = "focus_preview",
                },
            },
        },
    },

    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        opts = {
            defaults = {
                mappings = {
                    i = {
                        ["jj"] = { "<esc>", type = "command" },
                        ["<C-j>"] = function(...)
                            return require("telescope.actions").move_selection_next(...)
                        end,
                        ["<C-k>"] = function(...)
                            return require("telescope.actions").move_selection_previous(...)
                        end,
                    },
                },
            },
        },
    }
}
