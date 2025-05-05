
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

vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = "Write buffer shortcut", noremap = true })
vim.keymap.set('n', '<Leader>n', ':noh<CR>', { desc = "No highlight shortcut", noremap = true })
vim.keymap.set('n', '<Leader>==', 'gg=G\'\'', { desc = "Global fix indentation shortcut", noremap = true })

-- show diagnositcs
vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})


-- plugins
require("config.lazy")

