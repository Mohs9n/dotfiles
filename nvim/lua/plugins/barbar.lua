return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	-- opts = {
	--     -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
	--     -- animation = true,
	--     -- insert_at_start = true,
	--     -- …etc.
	-- },
	config = function()
		require("barbar").setup({
			auto_hide = 1,
			sidebar_filetypes = {
				["neo-tree"] = { event = "BufWipeout", text = "Neo-tree" },
			},
		})
		local nmap = function(keys, cmd, desc)
			vim.api.nvim_set_keymap("n", keys, cmd, { noremap = true, silent = true, desc = desc })
		end

		-- Move to previous/next
		nmap("<leader>.", "<Cmd>BufferNext<CR>", "Next Buffer")
		nmap("<leader>,", "<Cmd>BufferPrevious<CR>", "Next Buffer")
		-- nmap("n", "<A-,>", "<Cmd>BufferPrevious<CR>", "Next Next")
		-- nmap("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
		-- Re-order to previous/next
		-- map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
		-- map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
		-- -- Goto buffer in position...
		-- map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
		-- map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
		-- map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
		-- map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
		-- map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
		-- map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
		-- map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
		-- map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
		-- map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
		-- map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
		-- Pin/unpin buffer
		nmap("<leader>bp", "<Cmd>BufferPin<CR>", "Pin Buffer")

		-- Close buffer
		nmap("<leader>bc", "<Cmd>BufferClose<CR>", "Close Buffer")
		-- map("n", "<leader>bc", "<Cmd>BufferClose<CR>", destopts)
		-- Wipeout buffer
		--                 :BufferWipeout
		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight
		-- Magic buffer-picking mode
		nmap("<leader>p", "<Cmd>BufferPick<CR>", "Buffer Picker")
		-- Sort automatically by...
		-- map("n", "<leader>bsb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
		-- map("n", "<leader>b", "<Cmd>BufferOrderByDirectory<CR>", opts)
		-- map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
		-- map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

		-- Other:
		-- :BarbarEnable - enables barbar (enabled by default)
		-- :BarbarDisable - very bad command, should never be used
	end,
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}