-- session save and restore
return {
    "rmagatti/auto-session",
    event = "VeryLazy",
    config = function()
        local function close_neo_tree()
            require("neo-tree.sources.manager").close_all()
        end

        local function close_aerial()
            local success, module = pcall(require, "aerial")
            if not success then
                return
            end
            module.close_all()
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
                close_aerial,
            },
            -- post_restore_cmds = {
            -- 	open_neo_tree,
            -- },
        })
        -- Set mapping for searching a session.
        -- ⚠️ This will only work if Telescope.nvim is installed
        vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
            noremap = true,
        })
    end,
}
