


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
		local nvimTreeFocusOrToggle = function ()
			local nvimTree=require("nvim-tree.api")
			local currentBuf = vim.api.nvim_get_current_buf()
			local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
			if currentBufFt == "NvimTree" then
				nvimTree.tree.toggle()
			else
				nvimTree.tree.focus()
			end
		end
		vim.keymap.set("n", "<A-1>", nvimTreeFocusOrToggle)
	end,
}
