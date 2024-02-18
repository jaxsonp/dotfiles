

return {
	'Shatur/neovim-ayu',
	config = function()
		require('ayu').setup({
			mirage = true,
			overrides = {},
		})
	end,
}
