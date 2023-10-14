
<h1 align="center">sfnvim</h1>
<p align="center">
sfvim is a neovim config with a lot of useful plugins
</p>

## 🌟 Preview

![Preview Image](https://github.com/CJYLZS/nvim_config/assets/62733895/6dead1af-f37d-4cbd-9af7-39fe49c7f870)

![Preview Image](https://github.com/CJYLZS/nvim_config/assets/62733895/0bbb5749-4968-4567-995f-99d6ba5255a7)

## ✨ Features

- File explorer with [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Autocompletion with [Cmp](https://github.com/hrsh7th/nvim-cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- Terminal with [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)

## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/Recipes/icons)) <sup>[[1]](#1)</sup>
- [Neovim 0.8+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using) <sup>[[2]](#2)</sup>
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>/`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)

## 🛠️ Installation

### Linux/Mac OS (Unix)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone the repository

```shell
git clone --depth 1 https://github.com/CJYLZS/sfnvim ~/.config/nvim
nvim
```
