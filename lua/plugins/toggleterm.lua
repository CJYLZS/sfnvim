return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<Leader><CR>", "<cmd>ToggleTerm<cr>", desc = "Horizontal Term" },
		{ "<Leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Term" },
		{ "<Leader>th", "<cmd>ToggleTerm direction=horizontal size=10<cr>", desc = "Float Term" },
	},
	opts = {
		size = 10,
		on_create = function()
			vim.opt.foldcolumn = "0"
			vim.opt.signcolumn = "no"
		end,
		open_mapping = [[<F7>]],
		shading_factor = 2,
		direction = "float",
		float_opts = {
			border = "curved",
			highlights = { border = "Normal", background = "Normal" },
		},
	},
	config = function()
		require("toggleterm").setup({
			float_opts = {
				-- The border key is *almost* the same as 'nvim_open_win'
				-- see :h nvim_open_win for details on borders however
				-- the 'curved' border is a custom border type
				-- not natively supported but implemented in this plugin.
				-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- like `size`, width and height can be a number or function which is passed the current terminal
				-- width = <value>,
				-- height = <value>,
				winblend = 50,
				-- zindex = <value>,
			},
		})
	end,
}
