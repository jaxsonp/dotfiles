

-- toggle term, better terminal options
return({
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {--[[ things you want to change go here]]},
	config = function()
		require("toggleterm").setup{
			open_mapping = [[<c-\>]],
			direction = 'vertical',
			shade_terminals = true,
			persist_size = false,
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				else
					return 20
				end
			end,
		}

		vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	end,
})

