-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-format on save
-- vim.cmd([[
--   augroup formatautogroup
--     autocmd!
--     autocmd bufwritepost *.js,*.ts,*.jsx,*.tsx,*.html,*.css,*.json,*.yaml prettierasync
--   augroup end
-- ]])
--
-- vim.api.nvim_create_autocmd({ "bufwritepre" }, {
--   pattern = { "*.html", "*.css", "*.js", "*.jsx", "*.ts", "*.tsx" },
--   callback = function()
--     vim.lsp.buf.formatting_sync()
--   end,
-- })
