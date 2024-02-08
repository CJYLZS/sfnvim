-- highlight same word under ths cursor
return {
    "yamatsum/nvim-cursorline",
    -- event = { "BufReadPre", "BufNewFile" },
    event = { "BufEnter" },
    config = function()
        vim.cmd("hi CursorWord guibg=#484848")
        require("nvim-cursorline").setup({
            cursorline = {
                enable = false,
                timeout = 1000,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 2,
                hl = {
                    -- not work, temporarily use hi CursorWord ...
                    -- https://neovim.io/doc/user/api.html#nvim_set_hl()
                    underline = false,
                },
            },
        })
    end,
}
