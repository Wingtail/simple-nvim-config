
function ColorEm(color)
	vim.g.sonokai_style = 'espresso'
	vim.g.sonokai_better_performance = 1
	color = color or "sonokai"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorEm()
