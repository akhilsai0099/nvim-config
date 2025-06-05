vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.diagnostic.config({
  virtual_text = true,  -- enables inline diagnostics
})

vim.cmd('filetype plugin on')
vim.o.omnifunc = 'syntaxcomplete#Complete'

require("config.lazy")
