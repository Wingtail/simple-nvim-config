local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = 'lazygit', direction = "float" })
  return lazygit:toggle()
end
local builtin = require('telescope.builtin')
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local mappings = {
	a = {
		t = { "<cmd>AerialToggle! left<CR>", "Aerial Toggle" },
		a = { mark.add_file, "Harpoon Mark" },
		h = { function() ui.nav_file(1) end, "Harpoon 1" },
		r = { function() ui.nav_file(2) end, "Harpoon 2" },
		p = { function() ui.nav_file(3) end, "Harpoon 3" },
		o = { function() ui.nav_file(4) end, "Harpoon 4" },
		n = { function() ui.nav_file(5) end, "Harpoon 5" },
		"Aerial Toggle / Harpoon"
	},
	f = {
		f = { '<Plug>SnipRun', "SnipRun" },
		"Snip Run"
	},
	p = {
		v = { vim.cmd.NvimTreeToggle, "NvimTreeToggle"},
		f = { builtin.find_files, "Find Files (Telescope)"},
		s = { function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end, "Grep Search File" },
		"NvimTree / Find Files / Grep Search"
	},
	u = { vim.cmd.UndotreeToggle, "Undotree Toggle" },
	t = {
		t = { vim.cmd.ToggleTerm, "Terminal Split Below" },
		f = { toggle_float, "Floating Terminal" },
		l = { toggle_lazygit, "LazyGit" },
		"Toggle Terminal"
	},
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
vim.api.nvim_set_keymap('v', 'f', '<Plug>SnipRun', {silent = true})
