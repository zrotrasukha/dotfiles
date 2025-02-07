local fzf = require("fzf-lua")

_G.myfiles = function(opts)
	opts = opts or {}
	opts.debug = true -- use this to debug print the underlying command in the first line
	opts.cmd = opts.cmd or "fd --color=never --type f --hidden --follow"
	opts.actions = {
		["ctrl-g"] = function(_, o)
			_G.myfiles(o)
		end,
	}
	if opts.cmd:match("%s+%-%-no%-ignore$") then
		opts.cmd = opts.cmd:gsub("%s+%-%-no%-ignore$", "")
	else
		opts.cmd = opts.cmd .. " --no-ignore"
	end
	fzf.files(opts)
end

_G.myfiles()
