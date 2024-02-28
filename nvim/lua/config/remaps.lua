-- Remap <C-h> to <C-w>h in normal mode
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate left" })

-- Remap <C-j> to <C-w>j in normal mode
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate down" })

-- Remap <C-k> to <C-w>k in normal mode
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate up" })

-- Remap <C-l> to <C-w>l in normal mode
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate right" })

vim.keymap.set("t","<C-f>","<C-\\><C-n>")

vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", { silent=true, desc="Save File"})
