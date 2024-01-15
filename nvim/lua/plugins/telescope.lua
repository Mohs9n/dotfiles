return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Open Recent File" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "List buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        -- This is your opts table
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
                pickers = {
                    buffers = {
                        initial_mode="normal",
                        layout_config = {
                            width = 0.8,
                            preview_width = 0.6,
                        }
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
