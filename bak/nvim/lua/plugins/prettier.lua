return {
  -- other plugins...

  -- null-ls for integrating external tools like Prettier
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier, -- Use Prettier for formatting
          -- You can add more formatters or linters here
        },
      })
    end,
  },

  -- prettier.nvim for Prettier integration
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      require("prettier").setup({
        bin = "prettier", -- or 'prettierd' if you prefer
        filetypes = {
          "css",
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "yaml",
          -- add more filetypes if needed
        },
      })
    end,
  },

  -- other plugins...
}
