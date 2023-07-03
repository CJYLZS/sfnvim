-- tabbar
return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        -- { "<C-n>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        -- { "<C-p>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
        { "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", desc = "Move buffer next" },
        { "<leader>bN", "<Cmd>BufferLineMovePrev<CR>", desc = "Move buffer prev" },
    },
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        local bufferline = require("bufferline")
        bufferline.setup({
            options = {
                buffer_close_icon = "x",
                show_buffer_icons = true,
                left_trunc_marker = "",
                right_trunc_marker = "",
                -- stylua: ignore
                close_command = function(n) require("mini.bufremove").delete(n, false) end,
                -- stylua: ignore
                right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                -- diagnostics_indicator = function(_, _, diag)
                -- 	local icons = require("lazyvim.config").icons.diagnostics
                -- 	local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                -- 		.. (diag.warning and icons.Warn .. diag.warning or "")
                -- 	return vim.trim(ret)
                -- end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        })
    end,
}
