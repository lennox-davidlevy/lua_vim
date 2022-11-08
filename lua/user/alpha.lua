local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end


local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[    __  ___                  ___                     __]],
	[[   /  |/  /___ ___  ______ _/   |  ____  ____ ____  / /]],
	[[  / /|_/ / __ `/ / / / __ `/ /| | / __ \/ __ `/ _ \/ / ]],
	[[ / /  / / /_/ / /_/ / /_/ / ___ |/ / / / /_/ /  __/ /  ]],
	[[/_/  /_/\__/_/\__, /\__/_/_/  |_/_/ /_/\__, /\___/_/   ]],
	[[             /____/                   /____/           ]],
}
dashboard.section.buttons.val = {
	dashboard.button("r", "Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
	dashboard.button("p", "Find project", ":Telescope projects <CR>"),
	dashboard.button("t", "Find text", ":Telescope live_grep <CR>"),
	dashboard.button("q", "Quit", ":qa<CR>"),
}

local function footer()
	local mayaQuotes = {
		"Maya: 'OoooohHhhAhhhh' *gurgle*",
		"Maya: *farts*",
		"Maya: 'Ha! Ha! Ha!'",
		"Maya: *cries*",
    "Maya: *headbutts* *gurgle*",
    "Maya: 'Ah!' *kicks legs*",

	}
	return mayaQuotes[math.random(#mayaQuotes)]
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

