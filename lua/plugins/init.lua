local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    require("plugins.alpha"),
    require("plugins.bufremove"),
    require("plugins.bufferline"),
    require("plugins.neo-tree"),
    require("plugins.toggleterm"),
    require("plugins.startuptime"),
    require("plugins.telescope"),
    require("plugins.tokyonight"),
    require("plugins.nvim-cmp"),
    require("plugins.lsp.lsp_signature"),
    require("plugins.lsp.nvim-lspconfig"),
    require("plugins.which-key"),
    require("plugins.nvim-treesitter"),
    require("plugins.comment"),
    require("plugins.nvim-surround"),
    require("plugins.nvim-autopairs"),
    require("plugins.auto-session"),
    require("plugins.lightspeed"),
    require("plugins.lualine"),
    require("plugins.gitsigns"),
    require("plugins.aerial"),
    require("plugins.nvim-ufo"),
    require("plugins.noice"),
    require("plugins.nvim-osc52"),
}
local opts = {}
require("lazy").setup({ plugins, opts })

-- extra formatter
require("plugins.formatter")
