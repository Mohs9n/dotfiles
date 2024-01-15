return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.register({
            f = {
                name = "file",
                ["1"] = "which_key_ignore",
            },
            t = {
                name = "terminal"
            },
            b = {
                name = "buffers"
            },
            c = {
                name = "code"
            }
        }, { prefix = "<leader>" })
    end,
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
}
