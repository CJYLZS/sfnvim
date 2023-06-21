return {
	"rmagatti/auto-session",
	config = function()
		local function close_neo_tree()
			require("neo-tree.sources.manager").close_all()
			vim.notify("closed all")
		end

		local function open_neo_tree()
			vim.notify("opening neotree")
			require("neo-tree.sources.manager").show("filesystem")
		end
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- auto_session_create_enabled = false,
			-- auto_save_enabled = true,
			-- auto_restore_enabled = true,
			-- auto_session_use_git_branch = true,
			-- bypass_session_save_file_types = { "neo-tree" },
			pre_save_cmds = {
				close_neo_tree,
			},
			-- post_restore_cmds = {
			-- 	open_neo_tree,
			-- },
		})
	end,
}
