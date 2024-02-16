vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.wo.fillchars = 'eob: '
-- vim.opt.signcolumn = 'number'
vim.opt.signcolumn = 'yes:1'

-- markdown
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.opt.conceallevel = 2
vim.g.vim_markdown_no_extensions_in_markdown = 1
vim.g.vim_markdown_autowrite = 1

vim.o.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
