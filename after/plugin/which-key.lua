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

local mappings = {
	a = {
		t = { "<cmd>AerialToggle! left<CR>", "Aerial Toggle" },
		a = { mark.add_file, "Harpoon Mark" },
		"Aerial Toggle / Harpoon"
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
