vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.diagnostic.config({
	virtual_text = true, -- enables inline diagnostics
})

vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("filetype plugin on")
vim.o.omnifunc = "syntaxcomplete#Complete"

require("config.lazy")
