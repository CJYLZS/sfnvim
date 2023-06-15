return {
    'numToStr/Comment.nvim',
    keys = {
      { "<C-_>", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    config = function()
        require('Comment').setup({
	    toggler = {
		---Line-comment toggle keymap
		line = '<C-_>',
		---Block-comment toggle keymap
		block = 'gbc',
	    },
	    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
	    opleader = {
		---Line-comment keymap
		line = '<C-_>',
		---Block-comment keymap
		block = 'gb',
	    },
	})
    end
}
