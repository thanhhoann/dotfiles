require('plugins.keymaps')

local LSP = 'plugins.lsp.'
local UTILS = 'plugins.utils.'
local EDITING_SUPPORT = 'plugins.editing_support.'
local STATUS_LINE = 'plugins.status_line.'
local NOTE_TAKING = 'plugins.note_taking.'
local ENTERTAIN = 'plugins.entertain.'
local COLOR_SCHEMES = 'plugins.color_schemes.'
local EDUCATION = 'plugins.education.'

require(LSP .. 'lsp')
require(LSP .. 'treesitter')
require(LSP .. 'fugitive')
require(LSP .. 'goto-preview')

require(UTILS .. 'telescope')
require(UTILS .. 'harpoon')
require(UTILS .. 'oil')
require(UTILS .. 'neoscroll')
require(UTILS .. 'alpha')
-- require(UTILS .. 'notify') -- 2/1/2024

require(EDITING_SUPPORT .. 'null-ls')
require(EDITING_SUPPORT .. 'prettier')
require(EDITING_SUPPORT .. 'cmp')
-- require(EDITING_SUPPORT .. 'luasnip')
require(EDITING_SUPPORT .. 'comment')

-- require(NOTE_TAKING .. 'telekasten')
-- require(NOTE_TAKING .. 'smp')      -- Markdown Previewer
require(NOTE_TAKING .. 'obsidian')

require(STATUS_LINE .. 'lualine')

require(EDUCATION .. 'leetcode')

require(ENTERTAIN .. 'mini-animate')

require(COLOR_SCHEMES .. 'themery') -- theme picker
require(COLOR_SCHEMES .. 'material')
require(COLOR_SCHEMES .. 'tokyonight')
