

-- indent mini, indentation guides
return {
	'nvimdev/indentmini.nvim',
	event = 'BufEnter',
	config = function()
		require('indentmini').setup({
			char = "|",
			exclude = {
				"markdown",
			},
		})
		vim.cmd.highlight("default link IndentLine Comment")
	end,
}
