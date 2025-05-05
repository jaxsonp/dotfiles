return {
	{
		"EdenEast/nightfox.nvim",
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
		opts = {
			defaults = {},
			pickers = {
				find_files = {
					attach_mappings = function(prompt_bufnr, map)
						-- function to toggle hidden files on ctrl h
						local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
						local hidden = false

						local function toggle_hidden()
							hidden = not hidden
							picker:refresh(
								require('telescope.finders').new_oneshot_job(
									{ "rg", "--files", hidden and "--hidden" or nil },
									{ entry_maker = require('telescope.make_entry').gen_from_file() }
								),
								{ reset_prompt = true }
							)
							vim.notify(hidden and "Toggled hidden files ON" or "Toggled hidden files OFF")
						end

						map("i", "<C-h>", toggle_hidden)
						map("n", "<C-h>", toggle_hidden)

						return true
					end,
				},
				buffers = {
					mappings = {
						n = {
							["<Del>"] = require('telescope.actions').delete_buffer,
						}
					},
					sort_lastused = true,
				},
				diagnostics = {
					layout_strategy = "vertical",
				}
			}
		},
		keys = {
			{ '<Leader>b', function() require("telescope.builtin").buffers() end, desc = "[B]uffers", noremap = true },
			{ '<Leader>d', function() require("telescope.builtin").diagnostics({ bufnr=0 }) end, desc = "[D]iagnostics",  noremap = true },
			{ '<Leader>ff', function() require("telescope.builtin").find_files() end, desc = "[F]ind [F]iles",noremap = true },
			{ '<Leader>fa', function() require("telescope.builtin").find_files({ no_ignore=true }) end, desc = "[F]ind [A]ll files (don't respect gitignore)",noremap = true },
			{ '<Leader>fg', function() require("telescope.builtin").git_files() end, desc = "[F]ind [G]it files",noremap = true },
		}
	},
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			suppressed_dirs = { vim.fn.expand("~"), vim.fn.expand("~/Downloads"), "/" },
			lazy_support = true,
			show_auto_restore_notif = true,
		},
		keys = {
			{ '<Leader>ss', ':SessionSave<CR>', desc = "[S]ession [S]ave", noremap = true },
			{ '<Leader>sr', ':SessionRestore<CR>', desc = "[S]ession [R]estore", noremap = true },
		},
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			view = {
				side = "right",
				width = 40,
			},
			renderer = {
				icons = {
					git_placement = "after",
				}
			}
		},
		key = {
			{ '<Leader>tt', function() require("nvim-tree.api").tree.toggle({ path=vim.fn.getcwd() }) end, desc = "[T]ree [T]oggle", noremap = true },
			{ '<Leader>tf', function() require("nvim-tree.api").tree.find_file() end, desc = "[T]ree current [F]ile", noremap = true },
			{ '<Leader>tr', function() require("nvim-tree.api").tree.reload() end, desc = "[T]ree [R]eload", noremap = true },
		},
		init = function()
			-- gotta disable this cus the readme said
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
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

			if vim.lsp.inlay_hint then
				vim.lsp.inlay_hint.enable(true, { 0 })
			end

		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- update parsers on plugin update
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = { "lua", "rust", "toml", "python" },
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{ 'rust-lang/rust.vim' },
	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		ft = 'rust',
		init = function()
			vim.g.rustfmt_autosave = true
		end
	}
}
