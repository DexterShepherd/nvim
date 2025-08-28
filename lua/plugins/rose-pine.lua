return {
  "rose-pine/neovim",
  config = function()
    require("rose-pine").setup({
      dark_variant = "moon",
      styles = {
        transparency = true,
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
