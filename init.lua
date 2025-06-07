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
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
require("config.lazy")
