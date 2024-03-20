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
vim.opt.signcolumn = 'yes:1'

--  Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


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

-- copilot
vim.g.copilot_node_command = '/Users/thanhhoann/.local/share/nvm/v20.8.0/bin/node'
vim.g.copilot_lua_command = '/usr/local/bin/lua'
vim.g.no_tab_map = true
