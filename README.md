<!--toc:start-->

## 📜 TOC

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

**Dependencies**:

| Programs  | The why                                                       |
| --------- | ------------------------------------------------------------- |
| `nvim`    | because, yes.                                                 |
| `fzf`     | for Telescope.nvim                                            |
| `fd`      | for Telescope.nvim                                            |
| `rg`      | for Telescope.nvim                                            |
| `sqlite3` | for sqlite.lua                                                |
| `npm`     | for some LSP servers written in a Javascript related language |
| `cargo`   | For LSPs written in Rust.                                     |
| `go`      | For LSPs writte in Go.                                        |

**Other Dependencies**:

- `:checkhealth`
- `:checkhealth mason`

To install this configuration, you need a Neovim build. You can use your
favorite package manager or,
[Install from source](https://dev.to/asyncedd/building-neovim-from-source-1794).
Then clone this repository.

| System        | Command                                                                                                                                             |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| \*Nix systems | <pre lang="bash">mkdir ~/.config/nvim/<br>git clone https://github.com/asycnedd/nvim.git ~/.config/nvim/<br>nvim --headless "+Lazy! sync" +qa</pre> |
| Windows       | <pre lang="powershell">git clone https://github.com/asyncedd/nvim.git ~/AppData/Local/nvim/<br>nvim --headless "+Lazy! sync" +qa</pre>              |

Then it should bootstrap [lazy.nvim 💤](https://github.com/folke/lazy.nvim).
Then you can get a cup of [mocha ☕](https://github.com/catppuccin/nvim) while
you wait. (Not that long btw) Then once it finished, you're done for! ([actually](https://github.com/asyncedd/dots.nvim#-quitting-nvim))
Just run a `nvim` in your terminal :D

## ⚡ Performance

**⚠️ Super outdated!**

<details>
<summary>Expand to see screenshots!</summary>

No arguments (`nvim`)
![blank buffer](https://i.imgur.com/LelATuA.png)
With Argumetns (`nvim some.file`)
![a normal buffer](https://i.imgur.com/Wc66GFP.png)

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
