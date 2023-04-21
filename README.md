## 🏗️ DotsDotNvim (dots.nvim)
My personal Neovim configuration

## 👋 Introduction
This is my personal Neovim configuration as, I said.
Well I've structured the file architecture to be easy as possible to maintain.

It had optimized my workspace and, improve my productivity.

**Wait less, do more.**

## 🧱 A list of plugins
* **[lazy.nvim 💤](https://github.com/folke/lazy.nvim)** - A featureful plugin manager. Post modern `vim-plug`!
* [Catppuccin ☕](https://github.com/catppuccin/nvim) - A *beautiful*, colorful colorscheme.
* [Nvim-treesitter 🌳](https://github.com/nvim-treesitter/nvim-treesitter) - An additional abstract layer on top on the original Treesitter. (Actually 99% of it's users just use it for syntax highlighting)
* [leap.nvim 🦘](https://github.com/ggandor/leap.nvim) - Super fast motion plugin! Leap across your code!
* [flit.nvim 💉](https://github.com/ggandor/flit.nvim) - `f`/`F`/`t`/`T` motions on steriods. Built on [leap.nvim](https://github.com/ggandor/leap.nvim)
* [leap-spooky.nvim 👻](https://github.com/ggandor/leap-spooky.nvim) - Remotely operate from far away! Spooky! Built on [leap.nvim](https://github.com/ggandor/leap.nvim)
* [mini.ai 🤖](https://github.com/echasnovski/mini.ai) - Better `a`/`i` textobjects.
* [indent-blanklines.nvim 🤔](https://github.com/lukas-reineke/indent-blanklines.nvim) - Add indentation guides to all lines.
* [LSPconfig 🧠](https://github.com/neovim/nvim-lspconfig) - Configure LSP servers.
* [nvim-cmp 🤓](https://github.com/hrsh7th/nvim-cmp) - Auto completion!
* [LSPsaga ⚡](https://github.com/glepnir/lspsaga) - LSP Saga'd.

## 🤨 Crash course: Installing
To install this configuration, you need a Neovim build. You can use your favorite package manager or, [Install from source](https://dev.to/asyncedd/building-neovim-from-source-1794).
Then clone this repository.
# For *Nix (Linux/MacOS) systems:
```bash
mkdir ~/.config/nvim/
git clone https://github.com/asycnedd/nvim.git ~/.config/nvim/
```
# For Windows systems:
```bash
git clone https://github.com/asyncedd/nvim.git ~/AppData/Local/nvim/
```
Then it should bootstrap [lazy.nvim 💤](https://github.com/folke/lazy.nvim). Then you can get a cup of [mocha ☕](https://github.com/catppuccin/nvim) while you wait. (Not that long btw)
Then once it finished, you're done! (actually)
Just run a `nvim` in your terminal :D

## ⚡ Performance
* `nvim --clean` - [source](https://github.com/asyncedd/dots.nvim/blob/master/clean.log):
```
159.604  000.143: VimEnter autocommands
159.610  000.006: UIEnter autocommands
159.617  000.007: before starting main loop
163.176  003.559: first screen update
163.185  000.009: --- NVIM STARTED ---
```
* `nvim` - [source](https://github.com/asyncedd/dots.nvim/blob/master/normal.log):
```
097.963  000.019: VimEnter autocommands
098.052  000.089: UIEnter autocommands
121.276  022.729  022.729: sourcing /usr/local/share/nvim/runtime/autoload/provider/clipboard.vim
121.438  000.657: before starting main loop
124.377  002.939: first screen update
124.386  000.009: --- NVIM STARTED ---
```
As you can see, my Neovim configuration is FASTER than `nvim --clean`. This is because, I disabled unneeded RTP (runtime plugins) which took `125ms+`. That's 1.2 seconds! In my case, I have **24** plugins. I lazy loaded them so, it's blazingly fast!

## 😰 Quitting Nvim.
You're stuck here forever! Muahahahah! You fell RIGHT into my trap! There's no way out! >:D

## 😭 Problems.
I tried "re-working" everything for "better performance" but yo! it doesn't do anything!
