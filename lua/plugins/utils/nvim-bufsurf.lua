return {
    "CJYLZS/nvim-bufsurf",
    event = { "BufEnter" },
    config = function()
        require("nvim-bufsurf").setup()
        vim.api.nvim_set_keymap("n", "<C-P>", "<CMD>BufsurfBackward<CR>", { silent = true })
        vim.api.nvim_set_keymap("i", "<C-P>", "<CMD>BufsurfBackward<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-N>", "<CMD>BufsurfForward<CR>", { silent = true })
        vim.api.nvim_set_keymap("i", "<C-N>", "<CMD>BufsurfForward<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>P", "<CMD>DirsurfBackward<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<leader>N", "<CMD>DirsurfForward<CR>", { silent = true })
    end,
}
