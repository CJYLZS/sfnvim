-- copy to system clipboard using osc52
return {
    "ojroques/nvim-osc52",
    keys = {
        {
            "<C-c>",
            function()
                require("osc52").copy_visual()
            end,
            desc = "copy to system clipboard",
            mode = "v",
        },
    },
    config = function()
        require("osc52").setup({
            max_length = 0, -- Maximum length of selection (0 for no limit)
            silent = false, -- Disable message on successful copy
            trim = false, -- Trim surrounding whitespaces before copy
        })
    end,
}
