return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
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
					lualine_a = { { 'mode', padding = 1 } },
					lualine_b = {
						'filename',
					},
					lualine_c = {
						{ 'branch', padding = { left=2 } },
						'diff',
					},
					lualine_x = { {
						function()
							local session = require('auto-session.lib').current_session_name(true)
							if session == '' then
								return 'no session'
							else
								return session
							end
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
						padding = 1,
					} },
				}
			}
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
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
					sort_lastused = true,
					ignore_current_buffers = true,
				},
				diagnostics = {
					layout_strategy = "vertical",
				}
			}
		},
		keys = {
			{ '<Leader>b', function() require("telescope.builtin").buffers() end, desc = "[B]uffers", noremap = true },
			{ '<Leader>d', function() require("telescope.builtin").diagnostics({ bufnr=0 }) end, desc = "[D]iagnostics",  noremap = true },
			{ '<Leader>ff', function() require("telescope.builtin").find_files() end, desc = "[F]ind [F]iles", noremap = true },
			{ '<Leader>fg', function() require("telescope.builtin").find_files({ no_ignore=true }) end, desc = "[F]ind [G]it files (respect gitignore)", noremap = true },
			{ '<Leader>fa', function() require("telescope.builtin").find_files({ no_ignore=true, hidden=true }) end, desc = "[F]ind [A]ll files", noremap = true },
			{ '<Leader>gf', function() require("telescope.builtin").live_grep() end, desc = "[G]rep [F]ile", noremap = true },
		},
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
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
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
		keys = {
			{ '<Leader>tt', function() require("nvim-tree.api").tree.toggle({ focus = false }) end, desc = "[T]ree [T]oggle", noremap = true },
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
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "lua", "rust", "toml", "python", },
				highlight = { enable = true },
				indent = { enable = true },
			}
		end,
	},
	{ 'rust-lang/rust.vim' },
	{
		'mrcjkb/rustaceanvim',
		version = '^6',
		ft = 'rust',
		init = function()
			vim.g.rustfmt_autosave = true
		end
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						local augroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end
			})
		end,
	}
}
