


-- nvim tree, file explorer
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function ()

		-- disabling default file explorer for nvim-tree
		vim.g.loaded_netrw = false
		vim.g.loaded_netrwPlugin = false

		require("nvim-tree").setup {}

		-- hotkeys
		vim.keymap.set("n", "<A-1>", require("nvim-tree.api").tree.focus)
	end,
}
