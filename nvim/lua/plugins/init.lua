require('plugins.keymaps')
-- require('plugins.lsp.lua')

function add_plugin(plugin_name)
    require('plugins.configs.' .. plugin_name)
end

add_plugin('cmp')
add_plugin('cmp-sources')
add_plugin('mason-config')
add_plugin('fugitive')
add_plugin('treesitter')
add_plugin('noice')
add_plugin('notify')
add_plugin('alpha')
add_plugin('flutter-tools')
add_plugin('gitsigns')
add_plugin('harpoon')
add_plugin('oil')
add_plugin('telescope')
add_plugin('neoscroll')
add_plugin('fidget')
add_plugin('null-ls')
add_plugin('prettier')
add_plugin('comment')
add_plugin('formatter')
add_plugin('nvim-spider')
add_plugin('indent-blankline')
add_plugin('lualine')
add_plugin('barbecue')
add_plugin('leetcode')
add_plugin('themery')
add_plugin('flash')
add_plugin('rnvimr')
add_plugin('obsidian')
add_plugin('incline')
add_plugin('smooth-cursor')
add_plugin('pomo')
add_plugin('trouble')

-- add_plugin('navigator')

-- lsp
add_plugin('lsp')
-- add_plugin('lsp-inlayhints')
add_plugin('lspsaga')
add_plugin('lsp-kind')

-- colorschemes
add_plugin('material')
add_plugin('tokyonight')
add_plugin('night-owl')
add_plugin('catppuccin')

-- utils
add_plugin('hydrate')

-- AI
add_plugin('copilot')
