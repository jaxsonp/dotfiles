

-- toggle term, better terminal options
return({
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {--[[ things you want to change go here]]},
	config = function()
		require("toggleterm").setup{
			open_mapping = [[<c-\>]],
		}

		vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	end,
})

