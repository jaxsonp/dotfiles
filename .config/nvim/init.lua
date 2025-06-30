
-- Editing options

-- tab options
vim.o.tabstop = 4
vim.o.softtabstop = 0 -- use tabstop
vim.o.shiftwidth = 0 -- use tabstop
vim.o.expandtab = false
vim.o.smartindent = true




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

vim.g.mapleader = " "

vim.keymap.set('n', '<Leader>w', ':w<CR>', { desc = "Write buffer shortcut", noremap = true })
vim.keymap.set('n', '<Leader>n', ':noh<CR>', { desc = "No highlight shortcut", noremap = true })
vim.keymap.set('n', '<Leader>==', 'gg=G\'\'', { desc = "Global fix indentation shortcut", noremap = true })

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- disabling arrow keys cus I suck
vim.keymap.set("n", "<Up>", ":echoe 'Smh my head :('<CR>")
vim.keymap.set("n", "<Down>", ":echoe 'Smh my head :('<CR>")
vim.keymap.set("n", "<Left>", ":echoe 'Smh my head :('<CR>")
vim.keymap.set("n", "<Right>", ":echoe 'Smh my head :('<CR>")
vim.keymap.set("i", "<Up>", "<C-o>:echoe 'Smh my head :('<CR>")
vim.keymap.set("i", "<Down>", "<C-o>:echoe 'Smh my head :('<CR>")
vim.keymap.set("i", "<Left>", "<C-o>:echoe 'Smh my head :('<CR>")
vim.keymap.set("i", "<Right>", "<C-o>:echoe 'Smh my head :('<CR>")
vim.keymap.set("v", "<Up>", ":<C-u>echoe 'Smh my head :('<CR>")
vim.keymap.set("v", "<Down>", ":<C-u>echoe 'Smh my head :('<CR>")
vim.keymap.set("v", "<Left>", ":<C-u>echoe 'Smh my head :('<CR>")
vim.keymap.set("v", "<Right>", ":<C-u>echoe 'Smh my head :('<CR>")


-- plugins
require("config.lazy")

