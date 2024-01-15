---@diagnostic disable: lowercase-global
return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            shell = "fish",
        })
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction="float" })

        function _lazygit_toggle()
            lazygit:toggle()
        end

        vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>",
            { noremap = true, silent = true, desc="Lazygit" })
        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc="Toggle floating terminal"})
    end,
}
