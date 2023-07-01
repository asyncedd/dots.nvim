<!--toc:start-->

- [🏗️ DotsDotNvim (dots.nvim)](#%EF%B8%8F-dotsdotnvim-dotsnvim)
- [👋 Introduction](#-introduction)
- [Wow, a really good place to put: ⚠️ DISCLAIMER! ⚠️](#wow-a-really-good-place-to-put-️-disclaimer-️)
- [🤨 Crash course: Installing](#-crash-course-installing)
  - [🐧 For \*Nix (Linux/MacOS) systems:](#for-nix-linuxmacos-systems)
  - [🪟 For Windows systems:](#for-windows-systems)
- [⚡ Performance](#-performance)
- [😰 Quitting Nvim.](#-quitting-nvim)
- [Inspirations / Credits](#inspirations-credits)
<!--toc:end-->

## 🏗️ DotsDotNvim (dots.nvim)

:warning: This README is really really outdated since, I'm too lazy.

My personal Neovim configuration

![Size](https://img.shields.io/github/repo-size/asyncedd/dots.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)

<!-- ![ss](https://i.imgur.com/5pSbIS4.png) -->

![ss](https://files.catbox.moe/bm96wl.png)

## 👋 Introduction

This is my personal Neovim configuration as, I said. In the configuration I
prioritize the editing experience rather than speed and making it simple.
Really, the thing that matters for Neovim configs are:

- The overall editing experience

Not gonna lie, startup time doesn't really matter for Neovim configurations. Especially for when we're talking about the miliseconds.
But, it's about the overall editing experience of the editor.

## Wow, a really good place to put: ⚠️ DISCLAIMER! ⚠️

> Here's some DISCLAIMERS!

- If want to exit Neovim, just plug out your computer (or for laptop users...
  :) You don't want to). I meant, that'll never work.
- Auto-installing parsers via `auto_install = true` will send out a bunch of errors. Check: [this](https://github.com/nvim-treesitter/nvim-treesitter/issues/4250)

## 🤨 Crash course: Installing

Dependencies:

- `nvim` :)
- `fzf` for Telescope!
- `fd` for Telescope too!
- `sqlite3` for sqlite.lua
- `npm` for some LSP servers
- `cargo` just in case.
- `go` for Go LSPs

Other Dependencies:

`:checkhealth`
`:checkhealth mason`

To install this configuration, you need a Neovim build. You can use your
favorite package manager or,
[Install from source](https://dev.to/asyncedd/building-neovim-from-source-1794).
Then clone this repository.

# For \*Nix (Linux/MacOS) systems:

```bash
mkdir ~/.config/nvim/
git clone https://github.com/asycnedd/nvim.git ~/.config/nvim/
nvim --headless "+Lazy! sync" +qa
```

# For Windows systems:

```powershell
git clone https://github.com/asyncedd/nvim.git ~/AppData/Local/nvim/
nvim --headless "+Lazy! sync" +qa
```

Then it should bootstrap [lazy.nvim 💤](https://github.com/folke/lazy.nvim).
Then you can get a cup of [mocha ☕](https://github.com/catppuccin/nvim) while
you wait. (Not that long btw) Then once it finished, you're done for! ([actually](https://github.com/asyncedd/dots.nvim#-quitting-nvim))
Just run a `nvim` in your terminal :D

## ⚡ Performance

**⚠️ Super outdated!**

![blank buffer](https://i.imgur.com/LelATuA.png)
![a normal buffer](https://i.imgur.com/Wc66GFP.png)

## 😰 Quitting Nvim.

You're stuck here forever! Muahahahah! You fell RIGHT into my trap! There's no
way out! >:D

## Inspirations / Credits

- [NvChad](https://github.com/nvchad/nvchad) - For the lazyLoader function!
- [Ayamir's nvimdots](https://github.com/ayamir/nvimdots) - For some structuring
  and those snippets! (I actually started this repo 99% based on his structure)
- [Glepnir's dots](https://github.com/glepnir/nvim) - For the snippets!
- [akinsho's dots](https://github.com/akinsho/dotfiles/tree/nightly/.config/nvim) -
  For some snippets too!
- [abzcoding's dots](https://github.com/abzcoding/lvim) - Also for the snippets.
- [LazyVim](https://github.com/LazyVim/LazyVim) - Stole some configurations and
  some autocmds i think
- [Yutkat](https://github.com/yutkat/dotfiles) - For some Luasnip snippets :D and
  basically about a billion more stuff.
- [JoseConseco](https://github.com/JoseConseco) - For the CMP sorting
  configuration.
- [vsedov's config](https://github.com/vsedov/nvim) - For lots of configs!
- [Yuki Uthman](https://www.youtube.com/@yukiuthman8358) - For his great cmp
  turtorials.
- [pigeon's dots](https://github.com/backwardspy/dotfiles) - For some configs
- [Swayam](https://github.com/Swayam25) - For helping me with my null-ls.nvim configuration.
