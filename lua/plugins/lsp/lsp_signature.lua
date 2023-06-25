return {
    "ray-x/lsp_signature.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("lsp_signature").setup({
            -- bind = true, -- This is mandatory, otherwise border config won't get registered.
            -- handler_opts = {
            --     border = "rounded",
            -- },
            floating_window = false,
            floating_window_above_cur_line = false, -- try to place the floating above the current line when possible Note:
            -- will set to true when fully tested, set to false will use whichever side has more space
            -- this setting will be helpful if you do not want the PUM and floating win overlap
            transparency = 90, -- disabled by default, allow floating win transparent value 1~100
            shadow_blend = 0, -- if you using shadow as border use this set the opacity
            hint_prefix = "", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        })
    end,
}
