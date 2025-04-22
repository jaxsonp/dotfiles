return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false, -- load always
		priority = 1000, -- load first
		config = function()
			vim.cmd([[colorscheme carbonfox]])
		end,
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ -- adds confirm message before quitting
		"yutkat/confirm-quit.nvim",
		event = "CmdlineEnter",
		opts = {},
	},

	-- lsp config stuff
	{
		"williamboman/mason.nvim",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
}
