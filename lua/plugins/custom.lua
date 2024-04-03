return {
  -- Tmux Navigation
  {
    "christoomey/vim-tmux-navigator",
  },
  -- File explorer
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
        },
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        enable_close_on_slash = false,
      })
    end,
  },
  { "NicholasDunham/chuck.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {
              ui = {
                bg_gutter = "#1F1F28",
              },
            },
          },
        },
      })
    end,
  },
  { "simrat39/rust-tools.nvim" },
  { "saltmade/citylights.vim" },
  { "shaunsingh/solarized.nvim" },
  { "vimwiki/vimwiki" },
  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
      require("distant"):setup()
    end,
  },
}
