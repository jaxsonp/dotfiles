
		-- Editing options

-- tab options
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.g.mapleader = ","




		-- Visual options

-- line numbers
vim.o.number = true

-- whitespace
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:·,extends:»,precedes:«,nbsp:␣"
vim.o.showbreak = "~ "





		-- Behavior

-- leader commands
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':q<CR>', { noremap = true, silent = true })






		-- plugins

-- lazy.nvim (plugins in ./lua/plugins.lua)
require("config.lazy")


-- lsp stuff

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
	},
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			-- custom on_attach/capabilities here
		})
	end
})




