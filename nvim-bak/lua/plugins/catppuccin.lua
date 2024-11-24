return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 100,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- Lazy-load GitHub theme
  },
}
