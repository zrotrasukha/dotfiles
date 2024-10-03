return {
  {
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          keymaps = {
            accept_suggestion = "<C-t>", -- Accept the generated code with Tab
            clear_suggestion = "<C-]>", -- Clear the current suggestion with Ctrl+]
            accept_word = "<C-j>", -- Accept the current word with Ctrl+j
          },
          ignore_filetypes = { cpp = true }, -- Ignore suggestions in C++ files
          color = {
            suggestion_color = "#ffffff", -- Set the suggestion text color to white
            cterm = 244, -- Set the terminal color to 244
          },
          log_level = "info", -- Set the logging level to "info"
          disable_inline_completion = false, -- Enable inline completion
          disable_keymaps = false, -- Use built-in keymaps
          condition = function()
            return true -- Always allow SuperMaven to run
          end,
        })
      end,
    },
  },
  {},
}
