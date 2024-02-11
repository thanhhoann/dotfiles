local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable',
        lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------------------------------

local CMP = {
    { 'hrsh7th/nvim-cmp',         event = { 'InsertEnter', 'CmdlineEnter' } },
    -- sources
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'doxnit/cmp-luasnip-choice' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'mtoohey31/cmp-fish' },
    { 'amarakon/nvim-cmp-fonts' },
}

-- ---------------------------------------

local DEVELOPMENT = {
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
    { 'dart-lang/dart-vim-plugin' },
    -- { 'robertbrunhage/dart-tools.nvim' }
}

-- ---------------------------------------

local SNIPPETS = { { 'L3MON4D3/LuaSnip',            dependencies = { 'rafamadriz/friendly-snippets' } },
    { 'honza/vim-snippets' },
    { 'rafamadriz/friendly-snippets' },
}

-- ---------------------------------------

local GIT = {
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
}

-- ---------------------------------------

local TREE_SITTER = {
    { 'nvim-treesitter/nvim-treesitter',            build = ':TSUpdate' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    -- { 'nvim-treesitter/nvim-treesitter-context', build = ':TSUpdate' },
}

-- ---------------------------------------

local LSP = {
    { 'neovim/nvim-lspconfig' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- sources
    { 'onsails/lspkind.nvim' },
    { 'lvimuser/lsp-inlayhints.nvim' },
    { 'folke/lsp-colors.nvim' }
}

-- ---------------------------------------

local DATABASE = {
    -- {
    --     'tpope/vim-dadbod',
    --     opt = true,
    --     requires = {
    --         'kristijanhusak/vim-dadbod-ui',
    --         'kristijanhusak/vim-dadbod-completion',
    --     },
    -- },
    -- { 'kristijanhusak/vim-dadbod-ui' },
    -- { 'kristijanhusak/vim-dadbod-completion' },
}

-- ---------------------------------------

local TELESCOPE = {
    { 'nvim-telescope/telescope.nvim',               tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- sources
    { 'debugloop/telescope-undo.nvim' },
    { 'MaximilianLloyd/adjacent.nvim' }, -- find files in same dir
    { 'tsakirist/telescope-lazy.nvim' },
    { 'octarect/telescope-menu.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' }
}

-- ---------------------------------------

local UI = {
    { 'MunifTanjim/nui.nvim' },
    { 'goolord/alpha-nvim',  dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'j-hui/fidget.nvim' },
    { 'rcarriga/nvim-notify' },
    { 'folke/noice.nvim',    event = 'VeryLazy',                              opts = {}, dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' } },
}

-- ---------------------------------------

local FILE_MOTIONS = {
    { 'stevearc/oil.nvim',    opts = {},           dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'ThePrimeagen/harpoon', branch = 'harpoon2', dependencies = { 'nvim-lua/plenary.nvim' } },
}

-- ---------------------------------------

local DEBUG = {
    { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, opts = {} },
}

-- UTILS ---------------------------------------
local UTILS = {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
    { 'nvimtools/none-ls.nvim' }, -- null-ls alternative
    {
        'Exafunction/codeium.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
        config = function() require('codeium').setup({}) end
    },
    { 'xiyaowong/transparent.nvim' },
    {
        'anuvyklack/windows.nvim',
        dependencies = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },
    { 'brenoprata10/nvim-highlight-colors', config = function() require('nvim-highlight-colors').setup({}) end }
}

-- ---------------------------------------

local EDITING_SUPPORT = {
    { 'windwp/nvim-autopairs',        event = 'InsertEnter', opts = {} },
    { 'windwp/nvim-ts-autotag' },
    { 'cpea2506/relative-toggle.nvim' },
    { 'numToStr/Comment.nvim',        opts = {},             lazy = false },
    {
        'roobert/search-replace.nvim',
        config = function()
            require("search-replace").setup({
                default_replace_single_buffer_options = "gcI",
                default_replace_multi_buffer_options = "egcI",
            })
        end,
    },
    { 'MunifTanjim/prettier.nvim' },
    { 'mhartington/formatter.nvim' },
    { 'NvChad/nvim-colorizer.lua' },
    { 'chrisgrieser/nvim-spider',            lazy = true },
    { 'karb94/neoscroll.nvim' },
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function() require('treesj').setup({}) end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    }
}

-- ---------------------------------------

local TMUX = {
    { 'numToStr/Navigator.nvim', config = function() require('Navigator').setup() end }
}

-- ---------------------------------------

local EDUCATION = {
    {
        'kawre/leetcode.nvim',
        build = ':TSUpdate html',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {},
    }
}

-- ---------------------------------------

local STATUS_LINE = {
    { 'nvim-lualine/lualine.nvim' },
    {
        'utilyre/barbecue.nvim',
        name = 'barbecue',
        version = '*',
        dependencies = { 'SmiteshP/nvim-navic', 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },
    {
        'b0o/incline.nvim',
        opts = {},
        -- Optional: Lazy load Incline
        event = 'VeryLazy',
    },
}

-- ---------------------------------------

local COLOR_SCHEMES = {
    { 'zaldih/themery.nvim' }, -- realtime theme picker
    -- sources
    { 'folke/tokyonight.nvim' },
    { 'marko-cerovac/material.nvim' },
    { 'catppuccin/nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'sainnhe/gruvbox-material' },
    { 'rose-pine/neovim' },
    { 'ku1ik/vim-monokai' },
    { 'sainnhe/sonokai' },
    { 'dracula/vim' },
    { 'navarasu/onedark.nvim' },
    { 'oxfist/night-owl.nvim' },
}

-- ---------------------------------------

require('lazy').setup({
    COLOR_SCHEMES,
    DEVELOPMENT,
    TREE_SITTER,
    TELESCOPE,
    UI,
    DATABASE,
    GIT,
    SNIPPETS,
    LSP,
    CMP,
    FILE_MOTIONS,
    UTILS,
    EDITING_SUPPORT,
    TMUX,
    STATUS_LINE,
    EDUCATION,
    DEBUG
})
