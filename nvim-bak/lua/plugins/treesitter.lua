return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	run = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "cpp" }, -- Install Treesitter parser for C++
			highlight = {
				enable = true,
			},
		})
	end,
}
