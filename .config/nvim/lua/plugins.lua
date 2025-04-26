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
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require('lualine').setup {
				options = {
					component_separators = '',
					section_separators = { left = '', right = '' },
				},
				sections = {
					lualine_a = { { 'mode', separator = { left = '  ' }, padding = 1 } },
					lualine_b = {
						'filename',
					},
					lualine_c = {
						{ 'branch', padding = { left=2 } },
						'diff',
					},
					lualine_x = { {
						function()
							return require('auto-session.lib').current_session_name(true)
						end,
						padding = { right=2 }
					} },
					lualine_y = { {
						'lsp_status',
						draw_empty = true,
						icon = '',
						symbols = {
							spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
							done = '✓',
							separator = ' ',
						},
						ignore_lsp = {},
					} },
					lualine_z = { {
						'filetype',
						colored = false,
						separator = { right = '  ' },
						padding = 1,
					} },
				}
			}
		end
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			require('telescope').setup{}
		end
	},
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			suppressed_dirs = { '~/', '~/Downloads', '/' },
			show_auto_restore_notif = true,
		}
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			-- gotta disable this cus the readme said
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({
				view = {
					side = "right",
					width = 40,
				}
			})
		end
	},

	-- lsp config stuff
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
			}
		}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			-- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
			{ 'ms-jpq/coq.thirdparty', branch = "3p" }
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = 'shut-up',
				completion = {
					skip_after = { " ", "\t" }
				}
			}
		end,
		config = function()
			-- lsp settings

			require("mason").setup({
				PATH = "append",
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
				},
			})

			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						}
					}
				}
			})
			require('lspconfig').pyright.setup{}

			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "python", "markdown" },
				indent = { enable = true },
			})

		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function ()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { "lua", "rust", "toml", "python" }
			}
		 end
	},
	{ 'rust-lang/rust.vim' },
	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		lazy = false,
		config = function()
			vim.g.rustfmt_autosave = true
		end
	}
}
