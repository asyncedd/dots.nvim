## 🏗️ DotsDotNvim (dots.nvim)

:warning: This README is really really outdated since, I'm too lazy.

My personal Neovim configuration

![Size](https://img.shields.io/github/repo-size/asyncedd/dots.nvim?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41)

![ss](https://i.imgur.com/5pSbIS4.png)

## 👋 Introduction

This is my personal Neovim configuration as, I said. In the configuration I
prioritize the editing experience rather than speed and making it simple.
Really, the thing that matters for Neovim configs are:

- The overall editing experience

Not gonna lie, startup time doesn't really matter for Neovim configurations.
It's about the overall editing experience of the editor. Copy-pasting
stuff from this should be super easy, no nonsense spaggehti code and whatsoever.

It had optimized my workspace and, improve my productivity.

_Q 🙋 Why should I use this?_

> A: Don't. Do-not. Please don't. For the love of god. If you just use someone
> else's config, you're not really gonna boost your productivity. Just use this
> to steal configs and the file tree, I don't mind :)

## Wow, a really good place to put: ⚠️ DISCLAIMER! ⚠️

> Here's some DISCLAIMERS!

- If want to exit Neovim, just plug out your computer (or for laptop users...
  >:) You don't want to). I meant, that'll never work.

## 🤨 Crash course: Installing

Dependencies:

- `nvim` :)
- `fzf` for Telescope!
- `fd` for Telescope too!

Other Dependencies:

`:checkhealth`
`:checkhealth mason`

To install this configuration, you need a Neovim build. You can use your
favorite package manager or,
[Install from source](https://dev.to/asyncedd/building-neovim-from-source-1794).
Then clone this repository.

# For *Nix (Linux/MacOS) systems:

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
you wait. (Not that long btw) Then once it finished, you're done! (actually)
Just run a `nvim` in your terminal :D

# After

Go to TabNineHub or something and, turn code completion to CLOUD. Not Hybird nor local. Otherwise, you'll have severe performance issues! (on my machine)

## ⚡ Performance

TODO Redo it once ~~I get it to be more faster (troll)~~ Unlazy
This is really outdated btw.

Check [this](https://github.com/asyncedd/dots.nvim/tree/master/profiles)
Specs:
- Intel i7-6500U
- Bloated Arco Linux install.
- 16GB DDR3 RAM.
- Old SSD.
```
 ❯ sync; dd if=/dev/zero of=tempfile bs=1M count=1024; sync
1024+0 records in
1024+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 0.642741 s, 1.7 GB/s
```

![blank buffer](https://github.com/asyncedd/dots.nvim/blob/master/screenshots/2023-04-30_09-12.png?raw=true)
![a normal buffer](https://github.com/asyncedd/dots.nvim/blob/master/screenshots/2023-04-30_09-13.png?raw=true)
```!-- - `nvim --clean` - -->
<!--   [source](https://github.com/asyncedd/dots.nvim/blob/master/clean.log): -->
<!---->
<!-- ``` -->
<!-- 012.370  000.076: VimEnter autocommands -->
<!-- 012.373  000.003: UIEnter autocommands -->
<!-- 012.374  000.001: before starting main loop -->
<!-- 013.192  000.818: first screen update -->
<!-- 013.202  000.010: --- NVIM STARTED --- -->
<!-- ``` -->
<!---->
<!-- - `nvim` - -->
<!--   [source](https://github.com/asyncedd/dots.nvim/blob/master/normal.log): -->
<!---->
<!-- ``` -->
<!-- 026.451  000.384  000.384: require('dashboard.theme.hyper') -->
<!-- 026.779  001.861: UIEnter autocommands -->
<!-- 026.782  000.003: before starting main loop -->
<!-- 027.179  000.397: first screen update -->
<!-- 027.181  000.002: --- NVIM STARTED --- -->
<!-- ``` -->
<!---->
<!-- - `nvim init.lua --clean` - -->
<!--   [source](https://github.com/asyncedd/dots.nvim/blob/master/cleanedit.log) -->
<!---->
<!-- ``` -->
<!-- 029.448  000.080: VimEnter autocommands -->
<!-- 029.451  000.003: UIEnter autocommands -->
<!-- 029.452  000.001: before starting main loop -->
<!-- 030.247  000.795: first screen update -->
<!-- 030.250  000.003: --- NVIM STARTED --- -->
<!-- ``` -->
<!---->
<!-- - `nvim init.lua` - -->
<!--   [source](https://github.com/asyncedd/dots.nvim/blob/master/edit.log) -->
<!---->
<!-- ``` -->
<!-- 034.959  000.021: VimEnter autocommands -->
<!-- 034.990  000.030: UIEnter autocommands -->
<!-- 034.992  000.002: before starting main loop -->
<!-- 036.897  001.905: first screen update -->
<!-- 036.900  000.003: --- NVIM STARTED --- -->
<!-- ``` -->

~~As you can see, my Neovim configuration is FASTER than `nvim --clean`. This is
because, I disabled unneeded RTP (runtime plugins) which took `125ms+`. That's
1.2 seconds! In my case, I have **24** plugins. I lazy loaded them so, it's
blazingly fast!~~ As I've been adding more plugins (LSP, Completion etc...) It's
a bit slower now. But it's quite fast though!

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
- [folke's neodev](https://github.com/folke/neodev.nvim) - For his lazy plugin
  thingy!
- [mini.basics](https://github.com/echasnovski/mini.basics) - For some of the
  options :D
- [lazyvim](https://github.com/LazyVim/LazyVim) - Stole some configurations and
  some autocmds i think
- [chrisgrieser and yutkat](https://github.com/chrisgrieser/.config) For his DAP
  configurations.
- [mawkler](https://github.com/mawkler/nvim) - For a DAP keymap.
- [yukat](https://github.com/yutkat/dotfiles) - For some Luasnip snippets :D and
  basically about a billion more stuff.
- [JoseConseco](https://github.com/JoseConseco) - For the CMP sorting
  configuration.
- [vsedov's config](https://github.com/vsedov/nvim) - For lots of configs!
- [yuki uthman](https://www.youtube.com/@yukiuthman8358) - For his great cmp
  turtorials.
- [matthewsia98](https://github.com/matthewsia98/dotfiles) - For some cmp configurations.
