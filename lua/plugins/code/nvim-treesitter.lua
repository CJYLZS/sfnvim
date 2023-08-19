-- syntax highlight
return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            --   "nvim-treesitter/nvim-treesitter-textobjects",
            --   init = function()
            --     -- PERF: no need to load the plugin, if we only need its queries for mini.ai
            --     local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
            --     local opts = require("lazy.core.plugin").values(plugin, "opts", false)
            --     local enabled = false
            --     if opts.textobjects then
            --       for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            --         if opts.textobjects[mod] and opts.textobjects[mod].enable then
            --           enabled = true
            --           break
            --         end
            --       end
            --     end
            --     if not enabled then
            --       require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
            --     end
            --   end,
        },
    },
    keys = {
        { "<c-space>", desc = "Increment selection" },
        { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    ---@type TSConfig
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            -- "c",
            "cpp",
            -- "html",
            -- "javascript",
            "json",
            "lua",
            "luadoc",
            -- "luap",
            -- "markdown",
            -- "markdown_inline",
            "python",
            -- "query",
            -- "regex",
            -- "tsx",
            -- "typescript",
            -- "vim",
            -- "vimdoc",
            "yaml",
            "rust",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
    ---@param opts TSConfig
    config = function(_, opts)
        if string.match(vim.loop.os_uname().sysname, "^Windows") then
            require 'nvim-treesitter.install'.compilers = { "clang" }
        end
        if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)

        -- some extra highlight settings make highlight more like vscode
        vim.cmd("hi @include guifg=#c586c0")
        vim.cmd("hi @keyword.return guifg=#c586c0")
        vim.cmd("hi @repeat guifg=#c586c0")
        vim.cmd("hi @conditional guifg=#c586c0")
        vim.cmd("hi @keyword.operator guifg=#c586c0")
        vim.cmd("hi @exception guifg=#c586c0")
        vim.cmd("hi @keyword guifg=#569cd6")
        vim.cmd("hi @keyword.function guifg=#569cd6")
        vim.cmd("hi @punctuation.special guifg=#569cd6")
        vim.cmd("hi @boolean guifg=#569cd6")
        vim.cmd("hi @constant.builtin guifg=#569cd6")
        vim.cmd("hi @function guifg=#dcdcaa")
        vim.cmd("hi @function.builtin guifg=#dcdcaa")
        vim.cmd("hi @method guifg=#dcdcaa")
        vim.cmd("hi @method.call guifg=#dcdcaa")
        vim.cmd("hi @constructor guifg=#dcdcaa")
        vim.cmd("hi @attribute guifg=#dcdcaa")
        vim.cmd("hi @parameter guifg=#9cdcfe")
        vim.cmd("hi @variable guifg=#9cdcfe")
        vim.cmd("hi @variable.builtin guifg=#9cdcfe")
        vim.cmd("hi @field guifg=#9cdcfe")
        vim.cmd("hi @operator guifg=#d4d4d4")
        vim.cmd("hi @punctuation.delimiter guifg=#d4d4d4")
        vim.cmd("hi @string guifg=#ce9178")
        vim.cmd("hi @string.escape guifg=#d7ba7d")
        vim.cmd("hi @type guifg=#4ec9b0")
        vim.cmd("hi @type.builtin guifg=#4ec9b0")
        vim.cmd("hi @number guifg=#b5cea8")
        vim.cmd("hi @comment guifg=#6a9955")
        -- vim.cmd("hi @spell guifg=#6a9955")
        vim.cmd("hi @constant guifg=#4fc1ff")
    end,
}
