local if_nil = vim.F.if_nil

local default_header = {
    type = "text",
    val = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    },
    opts = {
        position = "center",
        hl = "AlphaHeader",
        -- wrap = "overflow";
    },
}

local datetime = {
    type = "text",
    val = os.date("%A %Y/%m/%d"),
    opts = {
        position = "center",
        hl = "Title",
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "AlphaFooter",
    },
}

local function get_latest_sessions()
    local dir = vim.fn.expand("~/.local/share/nvim/sessions/")
    local files = {}
    for _, name in ipairs(vim.fn.readdir(dir)) do
        local session = dir .. name
        table.insert(files, { name = name:gsub("%%", "/"):gsub("%.vim$", ""), modify_date = vim.fn.getftime(session) })
    end

    -- Sort files by modification date (most recent first)
    table.sort(files, function(a, b)
        return a.modify_date > b.modify_date
    end)
    local results = {}
    for i = 1, 5 do
        if files[i] then
            table.insert(results, files[i].name)
        else
            break
        end
    end
    return results
end

local function get_sessions()
    local res = {}
    for i, session in ipairs(get_latest_sessions()) do
        -- keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        -- opts.keymap = { "n", sc_, keybind, keybind_opts }
        local shortcut = tostring(i)
        local keybind = '<cmd>lua require("auto-session").RestoreSession(\'' .. session .. "')<CR>"
        local opts = {
            position = "center",
            shortcut = shortcut,
            cursor = 1,
            width = 50,
            align_shortcut = "right",
            hl = "Keyword",
            hl_shortcut = "AlphaShortcut",
            keymap = {
                "n",
                shortcut,
                keybind,
                { noremap = true, silent = true, nowait = true },
            },
        }
        local function on_press()
            local key = vim.api.nvim_replace_termcodes(keybind, true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end
        table.insert(res, { type = "button", val = session, on_press = on_press, opts = opts })
    end
    return res
end

local sessions = {
    type = "group",
    val = get_sessions(),
    -- opts = {
    -- spacing = 1,
    -- },
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 3,
        width = 50,
        align_shortcut = "right",
        hl = "AlphaButtons",
        hl_shortcut = "AlphaShortcut",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
        -- button("s", " " .. " Restore Session", [[:lua require("auto-session.session-lens").search_session() <cr>]]),
        button("s", " " .. " Restore Session", [[:lua AutoSession_search_session() <cr>]]),
        button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        button("q", " " .. " Quit", ":qa<CR>"),
    },
    opts = {
        -- spacing = 1,
        hl = "AlphaButtons",
    },
}

local section = {
    header = default_header,
    datetime = datetime,
    sessions = sessions,
    buttons = buttons,
    footer = footer,
}

local dashboard_config = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.datetime,
        { type = "padding", val = 2 },
        section.sessions,
        { type = "padding", val = 1 },
        section.buttons,
        { type = "padding", val = 2 },
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

-- startup dashboard

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function(_, dashboard)
        require("alpha").setup(dashboard_config)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
