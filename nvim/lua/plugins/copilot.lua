return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({})
        vim.keymap.set("n", "<leader>cp", require("copilot.suggestion").toggle_auto_trigger, { desc="Toggle Copilot"})
    end,
}
