-- key lint
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    -- opts = function(_, opts)
    --     if require("lazyvim.util").has("noice.nvim") then
    --         opts.defaults["<leader>sn"] = { name = "+noice" }
    --     end
    -- end,
}
