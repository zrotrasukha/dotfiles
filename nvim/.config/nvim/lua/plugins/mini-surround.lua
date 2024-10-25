return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "ga", -- Add surrounding in Normal and Visual modes
          delete = "gd", -- Delete surrounding
          find = "gf", -- Find surrounding (to the right)
          find_left = "gF", -- Find surrounding (to the left)
          highlight = "gh", -- Highlight surrounding
          replace = "gr", -- Replace surrounding
          update_n_lines = "gn", -- Update `n_lines`

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })
    end,
  },
}
