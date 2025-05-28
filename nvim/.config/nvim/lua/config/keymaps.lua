-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:!g++ -std=c++17 % -o %< && ./%<<CR>", { noremap = true })

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- file splitting
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- saveing file
keymap.set("n", "<leader>s", function()
  vim.cmd("w")
  vim.notify("File saved!", vim.log.levels.INFO)
end, opts)

-- move lines

keymap.set("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

--copy file path
vim.api.nvim_set_keymap(
  "n", -- Mode: Normal mode
  "<leader>cp", -- Shortcut: Leader key followed by 'cp'
  [[:let @+=expand('%:p:h')<CR>]], -- Command: Copy the file directory of the current buffer to the clipboard
  opts -- Options: No remap, silent execution
)
-- Harpoon: add file to marks
vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)

-- Show all marks (quick menu)
vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Navigate to specific marks (e.g., file 1, file 2, file 3)
vim.api.nvim_set_keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>", opts)

-- Navigate to next and previous marks
vim.api.nvim_set_keymap("n", "<leader>n", ":lua require('harpoon.ui').nav_next()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", ":lua require('harpoon.ui').nav_prev()<CR>", opts)

-- Oil: open
keymap.set("n", "<A-o>", ":Oil --float %:p:h<CR>", opts)

--Code Runner
keymap.set("n", "<leader>r", ":RunCode<CR>", opts)
keymap.set("n", "<leader>rf", ":RunFile<CR>", opts)
keymap.set("n", "<leader>rft", ":RunFile tab<CR>", opts)
keymap.set("n", "<leader>rp", ":RunProject<CR>", opts)
keymap.set("n", "<leader>rc", ":RunClose<CR>", opts)
keymap.set("n", "<leader>crf", ":CRFiletype<CR>", opts)
keymap.set("n", "<leader>crp", ":CRProjects<CR>", opts)
-- Move line up
keymap.set("n", "<leader>e", ":Neotree<CR>", opts)
keymap.set("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- quit
keymap.set("n", "<leader>q", ":quit<CR>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)
