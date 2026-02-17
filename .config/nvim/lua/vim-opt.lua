-- VIM CUSTOMS
vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.filetype.add({ extension = { mdx = "mdx" } })
vim.treesitter.language.register("markdown", "mdx")

-- vim.opt.spell = true
-- vim.opt.spelllang = {"en_us"}
-- vim.opt.spelloptions = {"camel"}
