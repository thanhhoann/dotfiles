require('plugins.keymaps')

local LSP = 'plugins.lsp.'
local UTILS = 'plugins.utils.'
local EDITING_SUPPORT = 'plugins.editing_support.'
local STATUS_LINE = 'plugins.status_line.'
local NOTE_TAKING = 'plugins.note_taking.'
local ENTERTAIN = 'plugins.entertain.'
local COLOR_SCHEMES = 'plugins.color_schemes.'
local EDUCATION = 'plugins.education.'
local CMP = 'plugins.cmp.'
local UI = 'plugins.ui.'
local FILE_MOTIONS = 'plugins.file_motions.'
local GIT = 'plugins.git.'

require(CMP .. 'cmp')
require(CMP .. 'cmp-sources')

require(LSP .. 'lsp')
require(LSP .. 'mason-config')
require(LSP .. 'treesitter')
require(LSP .. 'fugitive')
require(LSP .. 'goto-preview')

require(UI .. 'alpha')

require(GIT .. 'gitsigns')

require(FILE_MOTIONS .. 'harpoon')
require(FILE_MOTIONS .. 'oil')

require(UTILS .. 'telescope')
require(UTILS .. 'neoscroll')

require(EDITING_SUPPORT .. 'null-ls')
require(EDITING_SUPPORT .. 'prettier')
require(EDITING_SUPPORT .. 'comment')

require(NOTE_TAKING .. 'obsidian')

require(STATUS_LINE .. 'lualine')
require(STATUS_LINE .. 'barbecue') -- winbar

require(EDUCATION .. 'leetcode')

require(ENTERTAIN .. 'mini-animate')

require(COLOR_SCHEMES .. 'themery') -- theme picker
require(COLOR_SCHEMES .. 'material')
require(COLOR_SCHEMES .. 'tokyonight')
