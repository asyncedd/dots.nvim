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
- Auto-installing parsers via `auto_install = true` will send out a bunch of errors. Check: [this](https://github.com/nvim-treesitter/nvim-treesitter/issues/4250)

## 🤨 Crash course: Installing

Dependencies:

- `nvim` :)
- `fzf` for Telescope!
- `fd` for Telescope too!
- `sqlite3` for sqlite.lua

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

# 🚶 After

Go to TabNineHub or something and, turn code completion to CLOUD. Not Hybird nor local. Otherwise, you'll have severe performance issues! (on my machine)

## 📜 A comprehensive list of plugins

- [lazy.nvim](https://github.com/folke/lazy.nvim) - 💤 Modern plugin management
- [Catppuccin](https://github.com/catppuccin/nvim) - ☕ Soothing and pastel colorscheme
- [Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - 🌲 Enhanced syntax highlighting with pre-configured Treesitter queries
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - 💪 Powerful completion engine featuring no flicker!
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - 🤨 Completion engine using buffer words
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - 🧠 Completion engine for LSP
- [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - 🐧 Completion for the command line
- [cmp-emoji](https://github.com/hrsh7th/cmp-emoji) - 😀 Emoji selector in Neovim!
- [cmp-rg](https://github.com/lukas-reineke/cmp-rg) - 🔎 Ripgrep for the completion engine!
- [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) - 🤖 Tabnine source for Neovim
- [codeium.nvim](https://github.com/jcdickinson/codeium.nvim) - 🪄 Codeium - natively right inside Neovim
- [http.nvim](https://github.com/jcdickinson/http.nvim) - 🌐 HTTP library for Neovim plugins (needed for Codeium.nvim)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - ✂️ Luasnip snippets for cmp!
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - ✂️ Snippet engine that is written in Lua
- [barbecue.nvim](https://github.com/utilyre/barbecue.nvim) - 🍖 VSCode like winbar for Neoivm
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim) - 🚪 You better escape!
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - 💅 SNAZZY bufferline for Neovim
- [scope.nvim](https://github.com/tiagovla/scope.nvim) - 🔭 Enhanced tab scoping
- [drop.nvim](https://github.com/folke/drop.nvim) - 🍁 Fun little screensaver for Neovim - GET THAT EMACS!
- [flit.nvim](https://github.com/ggandor/flit.nvim) - `f`/`F`/`t`/`T` motions on Steroids!
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - 🤗 Friendly snippets for various languages
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - 🤯 Git integration for buffers
- [heirline.nvim](https://github.com/rebelot/heirline.nvim) - 🏃 No-nonsense statusline that is versatile and BLAZINGLY fast!
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - 📖 Indentation guides for Neovim
- [leap.nvim](https://github.com/ggandor/leap.nvim) - 🤔 You just got leaped!
- [leap-spooky.nvim](https://github.com/ggandor/leap-spooky.nvim) - 👻 Spooky leap!
- [lspconfig.nvim](https://github.com/neovim/nvim-lspconfig) - 📦 Neovim LSP config
- [lspkind.nvim](https://github.com/onsails/lspkind.nvim) - 🤩 Pretty icons for LSP
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - 🌈 Fast LSP UI
- [mason.nvim](https://github.com/williamboman/mason.nvim) - 📦 Neovim LSP manager
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - 🧠 LSPConfig x Mason.nvim
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - ⚡ Use non-LSP stff as LSP sources
- [mason-null-ls.nvim](https://github.com/jay-babu/mason-null-ls.nvim) - 📦 Null-ls x Mason.nvim
- [nvim-navic](https://github.com/SmiteshP/nvim-navic) - ❓ Show your current code context
- [mini.ai](https://github.com/echasnovski/mini.ai) - 💪 Extend and create `a`/`i` text objects
- [mini.animate](https://github.com/echasnovski/mini.animate) - 🎥 Basically `anime.nvim` would be
- [mini.bracketed](https://github.com/echasnovski/mini.bracketed) - 🚶 go foward/backward with square brackets
- [mini.bufremove](https://github.com/echasnovski/mini.bufremove) - 🧹 Remove buffers
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope) - 👁️ Visualize and operate on indent scope - anime'ed of course!
- [neodev.nvim](https://github.com/folke/neodev.nvim) - 💻 Neovim setup for `init.lua` and plugin dev
- [neogit](https://github.com/TimUntersberger/neogit) - 🧠 Magit for Neovim
- [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) - 🎥 Smooth scrolling
- [noice.nvim](https://github.com/folke/noice.nvim) - 💥 Experimental plugin for a NOICE UI!
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - 💥 UI component library for Neovim
- [notify.nvim](https://github.com/rcarriga/nvim-notify) - 💥 Notification UI library for Neovim.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - 🍐 Autopairs for Neovim!
- [ultimate-autopair.nvim](https://github.com/altermo/ultimate-autopair.nvim) - 👥 Also autopairs... for Neovim
- [npairs-integrate-upair](https://github.com/altermo/npairs-integrate-upair) - 🤝 Integrate ultimate-autopair.nvim and nvim-autopairs
- [nvim-colorizer.nvim](https://github.com/NvChad/nvim-colorizer.lua) - 🚄 Maintained fork of the fastest colorizer
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider) - 🕸️ `w`/`e`/`b` motions like a spider
- [nvim-surround](https://github.com/kylechui/nvim-surround) - 🗣 Surround with text objects
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - 👁️ Show the current code context
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - 🌲 Text objects on a tree
- [nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects) - 🌲 Syntax-aware text objects
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) - 💬 Comment string for treesitter
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - 💬 // Smart and powerful comments
- [ufo.nvim](https://github.com/kevinhwang91/nvim-ufo) - 👽 **U**ltra **FO**ld for Neovim
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - 📨 vim-web-devicons but in Lua
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - 🧠 New standard library for Neovim Lua
- [portal.nvim](https://github.com/cbochs/portal.nvim) - 🦅 Eagle (leap) for location lists
- [promise-async](https://github.com/kevinhwang91/promise-async) - 🧠 Async from JS to Lua
- [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) - 🦀🦀🦀 RUSTTTTTTT 🦀🦀🦀
- [specs.nvim](https://github.com/edluffy/specs.nvim) - 🕶️ Keep an eye on your jumps
- [tabout.nvim](https://github.com/abecodes/tabout.nvim) - 🦿 JUMP over parentheses, quotes and similar contexts today
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - ✅ Highlight, list and search TODOs
- [treesj](https://github.com/Wansmer/treesj) - 🌲 Split/join blocks of code
- [vim-illuminate](https://github.com/RRethy/vim-illuminate) - 🔦 Highlight LSP, Treesitter and regex stuff
- [vim-matchup](https://github.com/andymass/vim-matchup) - 👊 `%` on 👊
- [which-key.nvim](https://github.com/folke/which-key.nvim) - 💥 Display keymaps
- [wpm.nvim](https://github.com/jcdickinson/wpm.nvim) - 💥 WPM Calculator
- [NeoComposer](https://github.com/ecthelionvi/NeoComposer.nvim) - 🎻 Compose macros like Ludwig van Beethoven
- [alpha-nvim](https://github.com/goolord/alpha-nvim) - 🎨 Lua greeter
- [cellular-automaton](https://github.com/Eandrju/cellular-automaton.nvim) - 💥 Those nasty colleagues keep peeking over your shoulder and stealing your code? Now you can obfuscate your editor! Good luck stealing that.
- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - 👗 ~Dress your Neovim~ UI library
- [killersheep.nvim](https://github.com/seandewar/killersheep.nvim) - 🐑 🗡️ KILL SHEEP
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - 💤 Lazygit in Neovim, managed with lazy.nvim, lazily 💤
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) - 🌲 File tree in Neovim
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) - 🔎 Find the enemy and replace them with dark power
- [nvim-tetris](https://github.com/alec-gibson/nvim-tetris) - 🎮 Bring Emacs greatest feature into Neovim! TAKE THAT EMACS
- [nvim-various-textobjects](https://github.com/chrisgrieser/nvim-various-textobjs) - 💫 A dozen of text objects
- [octo.nvim](https://github.com/pwntester/octo.nvim) - 🐙 Github in Neovim - Take that EMACS!
- [sqlite.lua](https://github.com/kkharji/sqlite.lua) - ⚡ Let's spawn dozens of Sqlite VMs! Should be faster right?
- [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) - 👟 Be good at Vim motions
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim) - 🔭 Fuzzy find, filter, pick, all, Lua.
- [readline.nvim](https://github.com/linty-org/readline.nvim) - 🤓 Emacs.nvim essentially. But, actually might be useful for insert/cmdline mode though.
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - ⚡ Fzf natively for Telescope
- [smart-open.nvim](danielfalk/smart-open.nvim) - 🧠 Smart fast file-finding for Telescope
- [persisted.nvim](olimorris/persisted.nvim) - 💾 Simple Session management
- [blackjack.nvim](alanfortlink/blackjack.nvim) - 🖤 Blackjack in Neovim

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
- [Yukat](https://github.com/yutkat/dotfiles) - For some Luasnip snippets :D and
  basically about a billion more stuff.
- [JoseConseco](https://github.com/JoseConseco) - For the CMP sorting
  configuration.
- [vsedov's config](https://github.com/vsedov/nvim) - For lots of configs!
- [Yuki Uthman](https://www.youtube.com/@yukiuthman8358) - For his great cmp
  turtorials.
- [pigeon's dots](https://github.com/backwardspy/dotfiles) - For some configs
