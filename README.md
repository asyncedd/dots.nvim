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
* [mini.indentscope 🔫](https://github.com/echasnovski/mini.indentscope) - Show the current indent scope in a very fancy way.

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
081.097  000.014: VimEnter autocommands
081.230  000.133: UIEnter autocommands
081.264  000.034: before starting main loop
086.992  005.727: first screen update
086.999  000.008: --- NVIM STARTED ---
```

## 😰 Quitting Nvim.
You're stuck here forever! Muahahahah! You fell RIGHT into my trap! There's no way out! >:D

## 😭 Problems.
I tried "re-working" everything for "better performance" but yo! it doesn't do anything!
