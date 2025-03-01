return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "l3mon4d3/luasnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(), -- Scroll down with Ctrl + n
          ["<C-S-k>"] = cmp.mapping.select_next_item(), -- Scroll down with Ctrl + n
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- Scroll up with Ctrl + p
          ["<C-S-j>"] = cmp.mapping.select_prev_item(), -- Scroll down with Ctrl + n
          ["<C-S-d>"] = cmp.mapping.scroll_docs(4), -- Scroll docs down with Ctrl + d
          ["<C-S-u>"] = cmp.mapping.scroll_docs(-4), -- Scroll docs up with Ctrl + u
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion with Ctrl + Space
          ["<C-e>"] = cmp.mapping.close(), -- Close the completion menu with Ctrl + e
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm the selected item with Enter
          ["<Down>"] = cmp.mapping.select_next_item(), -- Down arrow key
          ["<Up>"] = cmp.mapping.select_prev_item(), -- Up arrow key
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
