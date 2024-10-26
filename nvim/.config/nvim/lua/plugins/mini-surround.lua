return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "ys", -- Add surrounding in Normal and Visual modes
          delete = "ds", -- Delete surrounding
          find = "ysf", -- Find surrounding (to the right)
          find_left = "ysF", -- Find surrounding (to the left)
          highlight = "ysh", -- Highlight surrounding
          replace = "ysr", -- Replace surrounding
          update_n_lines = "ysn", -- Update `n_lines`

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })
    end,
  },
}
