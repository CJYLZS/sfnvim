-- code fold
return {
    "kevinhwang91/nvim-ufo",
    event = { "BufReadPost" },
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                local builtin = require("statuscol.builtin")
                require("statuscol").setup({
                    relculright = true,
                    segments = {
                        {
                            text = { builtin.foldfunc },
                            click = "v:lua.ScFa",
                        },
                        {
                            text = { builtin.lnumfunc, " " },
                            click = "v:lua.ScLa",
                        },
                        {
                            text = { "%s" },
                            click = "v:lua.ScSa",
                        },
                    },
                })
            end,
        },
    },
    opts = {
        provider_selector = function(bufnr, filetype, buftype)
            return { "treesitter", "indent" }
        end,
    },
    config = function()
        vim.o.foldenable = true -- enable fold for nvim-ufo
        vim.o.foldlevel = 99 -- set high foldlevel for nvim-ufo
        vim.o.foldlevelstart = 99 -- start with all code unfolded
        vim.o.foldcolumn = "1"
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        -- Improved Code Folding
        vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
        vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Fold less" })
        vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Fold more" })
        vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor, { desc = "Peek fold" })
        require("ufo").setup()
    end,
}
