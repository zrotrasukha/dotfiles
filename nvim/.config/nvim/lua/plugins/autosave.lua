return {
	"Pocco81/auto-save.nvim",
	opts = {
		execution_message = {
			message = function() -- message to print on save
				return ("Saved at " .. vim.fn.strftime("%H:%M:%S"))
			end,
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 300, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
	},
	config = function()
		vim.api.nvim_command("ASToggle")
	end,
}
