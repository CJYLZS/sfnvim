-- file browser
return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>fb",
            "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
            desc = "open file browser",
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                file_browser = {
                    auto_depth = true,
                },
            },
        })
        -- To get telescope-file-browser loaded and working with telescope,
        -- you need to call load_extension, somewhere after setup function:
        require("telescope").load_extension("file_browser")
    end,
}
