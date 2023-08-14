require('sniprun').setup({
	display = {"NvimNotify", "Terminal"},
	display_options = {
		notification_timeout = 5,   -- timeout for nvim_notify output
		terminal_scrollback = vim.o.scrollback, -- change terminal display scrollback lines
		terminal_line_number = false, -- whether show line number in terminal window
		terminal_signcolumn = false, -- whether show signcolumn in terminal window
		terminal_width = 45,       -- change the terminal display option width
	},
	repl_enable = {'Julia_original'},
	interpreter_options = {
		Julia_original = {
			project=".", --# either a fixed absolute path, or "." for nvim's current directory (from echo getcwd()  )
			--# This directory has to contain a {Project,Manifest}.toml !
			interpreter="~/.julia/juliaup/julia-1.9.2+0.x64.linux.gnu/bin/julia"
		}
	}
}) 
