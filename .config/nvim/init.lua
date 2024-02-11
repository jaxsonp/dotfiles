
-- disabling default file explorer for nvim-tree
vim.g.loaded_netrw = false
vim.g.loaded_netrwPlugin = false

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ -- color scheme
		"rose-pine/neovim",
		name = "rose-pine",
		config = function ()		
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = true,
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				}
			})
		end,
	},
	{ -- tree sitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				highlight = { enable = true },
				indent = { enable = true},
			})
		end
	},
	{ -- indent guides 
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl", 
		opts = {}
	},
	{ -- file explorer
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
		"nvim-tree/nvim-web-devicons",
		},
		config = function ()
			require("nvim-tree").setup {}
		end,
	},
}, {})


-- appearance stuff
vim.opt.background = "dark"
vim.cmd("colorscheme rose-pine")
vim.cmd [[set termguicolors]]
vim.o.number = true

-- whitespace
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- behavior
vim.o.autoindent = true
vim.o.smartindent = true
