<a href="https://dotfyle.com/asyncedd/dotsnvim"><img src="https://dotfyle.com/asyncedd/dotsnvim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/asyncedd/dotsnvim"><img src="https://dotfyle.com/asyncedd/dotsnvim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/asyncedd/dotsnvim"><img src="https://dotfyle.com/asyncedd/dotsnvim/badges/plugin-manager?style=for-the-badge" /></a>

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://stand-with-ukraine.pp.ua)

<!--toc:start-->

## 📜 TOC

- [🏗️ DotsDotNvim (dots.nvim)](#%EF%B8%8F-dotsdotnvim-dotsnvim)
- [👋 Introduction](#-introduction)
- [Wow, a really good place to put: ⚠️ DISCLAIMER! ⚠️](#wow-a-really-good-place-to-put-️-disclaimer-️)
- [🤨 Crash course: Installing](#-crash-course-installing)
- [⚡ Performance](#-performance)
- [😰 Quitting Nvim.](#-quitting-nvim)
- [Inspirations / Credits](#inspirations--credits)
<!--toc:end-->

## 🏗️ DotsDotNvim (dots.nvim)

:warning: This README is really really outdated since, I'm too lazy.

My personal Neovim configuration

![Size](https://img.shields.io/github/repo-size/asyncedd/dots.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)

<!-- ![ss](https://i.imgur.com/5pSbIS4.png) -->

![ss](https://files.catbox.moe/p0pogb.png)

## 👋 Introduction

This is my personal Neovim configuration.
You can yank/put but you can only yank/put **ONLY** what you now!

## Wow, a really good place to put: ⚠️ DISCLAIMER! ⚠️

> Here's some DISCLAIMERS!

- If want to exit Neovim, just plug out your computer (or for laptop users...
  :) You don't want to). I meant, that'll never work.
- Auto-installing parsers via `auto_install = true` will send out a bunch of errors. Check: [this](https://github.com/nvim-treesitter/nvim-treesitter/issues/4250)

## 🤨 Crash course: Installing

**Dependencies**:

| Programs  | The why                               |
| --------- | ------------------------------------- |
| `nvim`    | because, yes.                         |
| `fd`      | for Telescope.nvim                    |
| `rg`      | for Telescope.nvim                    |
| `sqlite3` | for sqlite.lua                        |
| `gcc`     | For Tressitter                        |
| `npm`     | for LSP servers written in Javascript |
| `cargo`   | For LSPs written in Rust.             |
| `go`      | For LSPs writte in Go.                |

**Other Dependencies**:

- `:checkhealth`
- `:checkhealth mason`

To install this configuration, you need a Neovim build. You can use your
favorite package manager or,
[Install from source](https://dev.to/asyncedd/building-neovim-from-source-1794).
Then clone this repository.

> [!IMPORTANT]  
> Install requires Neovim 0.10 (Latest nightly). Always review the code before installing a configuration.

| Operation    | Command                                                                                                                                            |
| ------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Installation | <pre lang="sh">git clone https://github.com/asyncedd/dots.nvim ~/.config/dots.nvim NVIM_APPNAME=dots.nvim/ nvim --headless +"Lazy! sync" +qa</pre> |
| Open         | <pre lang="sh">NVIM_APPNAME=dots.nvim/ nvim</pre>                                                                                                  |

Then it should bootstrap [lazy.nvim 💤](https://github.com/folke/lazy.nvim).
Then you can get a cup of [mocha ☕](https://github.com/catppuccin/nvim) while
you wait. (Not that long btw) Then once it finished, you're done for! ([actually](https://github.com/asyncedd/dots.nvim#-quitting-nvim))
Just run a `nvim` in your terminal :D

## ⚡ Performance

**⚠️ Super outdated!**

<details>
<summary>Expand to see screenshots!</summary>

| Context                           | Screenshot                                              |
| --------------------------------- | ------------------------------------------------------- |
| No arguments (`nvim`)             | ![blank buffer](https://files.catbox.moe/ckipl3.png)    |
| With Arguments (`nvim some.file`) | ![a normal buffer](https://files.catbox.moe/rlchtc.png) |

</details>

## 😰 Quitting Nvim.

You're stuck here forever! Muahahahah! You fell RIGHT into my trap! There's no
way out! >:D

## Inspirations / Credits

| Repo                                                                            | Why?                                                |
| ------------------------------------------------------------------------------- | --------------------------------------------------- |
| [NvChad](https://github.com/nvchad/nvchad)                                      | For the lazy loading function and more!             |
| [Ayamir's nvimdots](https://github.com/ayamir/nvimdots)                         | For some structuring and those snippets!            |
| [Glepnir's dots](https://github.com/glepnir/nvim)                               | For the snippets!                                   |
| [Akinsho's dots](https://github.com/akinsho/dotfiles/tree/nightly/.config/nvim) | For some snippets too!                              |
| [abzcoding's dots](https://github.com/abzcoding/lvim)                           | Also for the snippets!                              |
| [LazyVim](https://github.com/LazyVim/LazyVim)                                   | Stole some configurations and some autocmds i think |
| [Yutkat](https://www.youtube.com/@yukiuthman8358)                               | For his great config.                               |
| [vsedov's config](https://github.com/vsedov/nvim)                               | For lots of configs!                                |
| [pigeon's dots](https://github.com/backwardspy/dotfiles)                        | For some configs!                                   |
| [Swayam](https://github.com/Swayam25)                                           | For helping me with my null-ls.nvim configuration.  |

Some of this README was generated by [Dotfyle](https://dotfyle.com)
