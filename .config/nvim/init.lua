
-- Editing options

-- tab options
vim.o.tabstop = 4
vim.o.softtabstop = 0 -- use tabstop
vim.o.shiftwidth = 0 -- use tabstop
vim.o.expandtab = false
vim.o.smartindent = true

vim.g.mapleader = ","




-- Visual options

-- line numbers
vim.o.number = true

-- whitespace
vim.o.list = true
vim.o.listchars = "tab:│ ,trail:·,extends:»,precedes:«,nbsp:␣"
vim.o.showbreak = "~ "





-- Behavior

-- confirm quit w/o save
vim.opt.confirm = true

-- what's included in a session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"


-- leader commands

vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>==', 'gg=G\'\'', { noremap = true, silent = true })

vim.keymap.set('n', '<Leader>b', ':lua require("telescope.builtin").buffers({})<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>d', ':lua require("telescope.builtin").diagnostics({ bufnr=0 })<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>ff', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })

-- telescope git_files if in git repo, otherwise find_files
local is_inside_git_tree = {}
vim.keymap.set('n', '<leader>g', function()
	local opts = {}
	local cwd = vim.fn.getcwd()
	if is_inside_git_tree[cwd] == nil then
		vim.fn.system("git rev-parse --is-inside-work-tree")
		is_inside_git_tree[cwd] = vim.v.shell_error == 0
	end
	if is_inside_git_tree[cwd] then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end, { noremap = true })

vim.keymap.set('n', '<Leader>tt', ':lua require("nvim-tree.api").tree.toggle({ path=vim.fn.getcwd() })<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tr', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })



-- plugins
require("config.lazy")

