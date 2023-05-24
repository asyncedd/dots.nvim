-- lua/plugins/specs/games.lua
--
--  ┌
--  │    Add games into the best editor (hands down) whilst
--  │               stealing ideas from an Emacs
--  └

return {
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
    config = function()
      require("plugins.configs.games.cellular-automation")
    end,
  },
  {
    "seandewar/killersheep.nvim",
    config = true,
    cmd = "KillKillKill",
  },
  {
    "alec-gibson/nvim-tetris",
    cmd = "Tetris",
  },
  {
    "alanfortlink/blackjack.nvim",
    cmd = {
      "BlackJackNewGame",
      "BlackJackQuit",
      "BlackJackResetScores",
    },
  },
}
