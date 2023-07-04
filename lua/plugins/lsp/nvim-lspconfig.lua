-- lspconfig
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local on_attach = function(client, bufnr)
            require("plugins.lsp.lsp_signature").on_attach(client, bufnr) -- Note: add in lsp client on-attach
        end
        -- python-lsp-server
        lspconfig.pylsp.setup({
            on_attach = on_attach,
            settings = {
                pylsp = {
                    plugins = {
                        autopep8 = { enabled = false },
                        pycodestyle = {
                            enabled = false,
                            ignore = { "W391" },
                            maxLineLength = 100,
                        },
                        pylsp_mypy = { enabled = false },
                        pylint = { enabled = false },
                        pyflakes = { enabled = false },
                        jedi = {
                            -- extra analyze path
                            extra_paths = {},
                        },
                    },
                },
            },
        })
        -- lua-lsp-server
        require("lspconfig").lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        enable = true,
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
        -- bash lsp server
    end,
}
