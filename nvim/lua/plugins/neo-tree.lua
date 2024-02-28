return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode`
    },
    config = function()
        require("neo-tree").setup({
            enable_normal_mode_for_inputs = true,
        })
        vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", { desc = "Toggle Neotree", silent = true })
    end,
}
