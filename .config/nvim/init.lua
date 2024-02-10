
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
	{
		"rebelot/kanagawa.nvim"
	},
}, {})


-- appearance stuff
vim.cmd [[set termguicolors]]
vim.cmd [[colorscheme kanagawa]]
vim.o.number = true

-- whitespace
vim.o.tabstop = 4
vim.o.shiftwidth = 4
