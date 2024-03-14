return {
    "nvim-pack/nvim-spectre",
    event = { "BufEnter" },
    config = function()
        vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', {
            desc = "Toggle Spectre",
        })
        vim.keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current word",
        })
        vim.keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word",
        })
        vim.keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
            desc = "Search on current file",
        })
        require("spectre").setup({
            find_engine = {
                -- rg is map with finder_cmd
                ["rg"] = {
                    cmd = "rg",
                    -- default args
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--pcre2",
                    },
                    options = {
                        ["ignore-case"] = {
                            value = "--ignore-case",
                            icon = "[I]",
                            desc = "ignore case",
                        },
                        ["hidden"] = {
                            value = "--hidden",
                            desc = "hidden file",
                            icon = "[H]",
                        },
                        -- you can put any rg search option you want here it can toggle with
                        -- show_option function
                    },
                },
                ["ag"] = {
                    cmd = "ag",
                    args = {
                        "--vimgrep",
                        "-s",
                    },
                    options = {
                        ["ignore-case"] = {
                            value = "-i",
                            icon = "[I]",
                            desc = "ignore case",
                        },
                        ["hidden"] = {
                            value = "--hidden",
                            desc = "hidden file",
                            icon = "[H]",
                        },
                    },
                },
            },
            replace_engine = {
                ["sed"] = {
                    cmd = "sed",
                    args = nil,
                    options = {
                        ["ignore-case"] = {
                            value = "--ignore-case",
                            icon = "[I]",
                            desc = "ignore case",
                        },
                    },
                },
                -- call rust code by nvim-oxi to replace
                ["oxi"] = {
                    cmd = "oxi",
                    args = {},
                    options = {
                        ["ignore-case"] = {
                            value = "i",
                            icon = "[I]",
                            desc = "ignore case",
                        },
                    },
                },
            },
            default = {
                find = {
                    --pick one of item in find_engine
                    cmd = "rg",
                    options = { "ignore-case" },
                },
                replace = {
                    --pick one of item in replace_engine
                    cmd = "sed",
                },
            },
            replace_vim_cmd = "cdo",
            is_open_target_win = true, --open file on opener window
            is_insert_mode = false, -- start open panel on is_insert_mode
        })
    end,
}
