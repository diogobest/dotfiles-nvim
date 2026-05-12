return {
  -- { "ellisonleao/gruvbox.nvim" },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     -- colorscheme = "gruvbox",
  --     colorscheme = "tokyonight-night",
  --   },
  -- },
  {
    "vague-theme/vague.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vague",
    },
  },
}
