return {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("lsp_signature").setup({
            -- bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "shadow", -- double, single, shadow, none
            },
            hint_enable = false, -- virtual hint enable
            -- hint_prefix = "", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
            -- max_height = 5, -- max height of signature floating_window
            floating_window = true,
            floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
            -- will set to true when fully tested, set to false will use whichever side has more space
            -- this setting will be helpful if you do not want the PUM and floating win overlap
            hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
            transparency = 35, -- disabled by default, allow floating win transparent value 1~100
            shadow_guibg = "Black",
            shadow_blend = 0, -- if you using shadow as border use this set the opacity
            move_cursor_key = "<tab>",
            select_signature_key = "<C-n>",
        })
    end,
}
