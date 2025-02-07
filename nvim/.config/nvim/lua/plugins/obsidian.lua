return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "/home/zrotrasukha/Documents/Obsidian/04_BCA/(HCI)-Human-Computer-Interaction/Module-2",
			},
		},
		templates = {
			folder = "/home/zrotrasukha/MEGA/MEGA/Knowledge_and_Info/Template",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
			},
		},
	},
}
