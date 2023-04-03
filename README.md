## 🏗️ DotsDotNvim (dots.nvim)
My personal Neovim configuration

![Size](https://img.shields.io/github/repo-size/asyncedd/dots.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)

## 👋 Introduction
This is my personal Neovim configuration as, I said.
In the configuration I prioritize the editing experience rather than speed and making it simple.
Really, the thing that matters for Neovim configs are:
- Customizability
- Hackablity
- The overall editing experience
- Modulability
- Speed

Not gonna lie, startup time doesn't really matter for Neovim configurations. It's about the hackablity and the customizability of the editor.
Copy-pasting stuff from this should be super easy, no nonsense spaggehti code and whatsoever.

It had optimized my workspace and, improve my productivity.

*Q 🙋 Why should I use this?*
> A: Don't. Do-not. Please don't. For the love of god. If you just use someone else's config, you're not really gonna boost your productivity. Just use this to steal configs and the file tree, I don't mind :)

**Think less, do more.**

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
TODO Redo it once ~~I get it to be more faster (troll)~~ Unlazy
* `nvim --clean` - [source](https://github.com/asyncedd/dots.nvim/blob/master/clean.log):
```
009.424  000.083: VimEnter autocommands
009.426  000.002: UIEnter autocommands
009.428  000.001: before starting main loop
010.292  000.864: first screen update
010.295  000.003: --- NVIM STARTED ---
```
* `nvim` - [source](https://github.com/asyncedd/dots.nvim/blob/master/normal.log):
```
028.411  000.140  000.140: require('dashboard.theme.hyper')
028.664  001.769: UIEnter autocommands
028.667  000.003: before starting main loop
029.327  000.660: first screen update
029.330  000.003: --- NVIM STARTED ---
```
~~As you can see, my Neovim configuration is FASTER than `nvim --clean`. This is because, I disabled unneeded RTP (runtime plugins) which took `125ms+`. That's 1.2 seconds! In my case, I have **24** plugins. I lazy loaded them so, it's blazingly fast!~~
As I've been adding more plugins (LSP, Completion etc...) It's a bit slower now. But it's quite fast though!

## 😰 Quitting Nvim.
You're stuck here forever! Muahahahah! You fell RIGHT into my trap! There's no way out! >:D

## 😭 Problems.
I tried "re-working" everything for "better performance" but yo! it doesn't do anything!
