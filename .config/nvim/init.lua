
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
require("lazy").setup("plugins")


-- appearance stuff
vim.opt.background = "dark"
vim.cmd("colorscheme ayu-mirage")
vim.cmd [[set termguicolors]]
vim.o.number = true
vim.o.cursorline = true

-- whitespace
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- behavior
vim.o.autoindent = true
vim.o.smartindent = true






