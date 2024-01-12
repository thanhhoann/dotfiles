local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ---------------------------------------

local CMP = {
    {
        'hrsh7th/nvim-cmp',
        event = { "InsertEnter", "CmdlineEnter" },
    },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'doxnit/cmp-luasnip-choice' },

    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },

    { 'mtoohey31/cmp-fish' },
    { 'amarakon/nvim-cmp-fonts' },
}

-- ---------------------------------------

local SNIPPETS = {
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { "honza/vim-snippets" },
    { 'rafamadriz/friendly-snippets' },
}

-- ---------------------------------------

local GIT = {
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
}

-- ---------------------------------------

local LSP = {
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

    { 'neovim/nvim-lspconfig' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'onsails/lspkind.nvim' },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- { 'rmagatti/goto-preview' }, -- previewing definitions using floating windows
}

-- ---------------------------------------

local SESSION = {
    { 'tpope/vim-obsession' }
}

-- ---------------------------------------

local DATABASE = {
    {
        "tpope/vim-dadbod",
        opt = true,
        requires = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
    },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion' },
}

-- ---------------------------------------

local TELESCOPE = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { "debugloop/telescope-undo.nvim" },
    { "MaximilianLloyd/adjacent.nvim" }, -- find files in same dir
    { "tsakirist/telescope-lazy.nvim" },
    { 'octarect/telescope-menu.nvim' }
}

-- ---------------------------------------

local UTILS = {
    { 'nvim-tree/nvim-web-devicons' },

    { "MunifTanjim/nui.nvim" },
    { "karb94/neoscroll.nvim" },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    {
        "AckslD/nvim-neoclip.lua",
        requires = {
            -- you'll need at least one of these
            -- {'nvim-telescope/telescope.nvim'},
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    },
    { 'xiyaowong/nvim-transparent' },

}

-- ---------------------------------------

local FILE_MOTIONS = {
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { 'ThePrimeagen/harpoon' },
}

-- ---------------------------------------

local FOLKE = {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    { -- https://github.com/folke/todo-comments.nvim
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

}

-- ---------------------------------------

local EDITING_SUPPORT = {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    { 'windwp/nvim-ts-autotag' },
    { 'gbprod/yanky.nvim' },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'MunifTanjim/prettier.nvim' },
    { 'tpope/vim-surround' },
    { "cpea2506/relative-toggle.nvim" },
    { "folke/twilight.nvim",            opts = {} },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
}

-- ---------------------------------------

local TMUX = {
    {
        'christoomey/vim-tmux-navigator',
        lazy = false
    }
}

-- ---------------------------------------

local EDUCATION = {
    { 'ThePrimeagen/vim-be-good' },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    }
}

-- ---------------------------------------

local ENTERTAIN = {
    { 'eandrju/cellular-automaton.nvim' },
    { 'echasnovski/mini.nvim',          version = '*' },
}

-- ---------------------------------------

local STATUS_LINE = {
    { 'nvim-lualine/lualine.nvim' }
}

-- ---------------------------------------

local SUGGESTION = {
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },
}

-- ---------------------------------------

local NOTE_TAKING = {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}

-- ---------------------------------------

local COLOR_SCHEMES = {
    { 'zaldih/themery.nvim' }, -- theme picker update realtime

    -- reference : https://github.com/linrongbin16/colorbox.nvim/blob/main/COLORSCHEMES.md
    { "folke/tokyonight.nvim" },
    { 'marko-cerovac/material.nvim' },
    { 'catppuccin/nvim' },
    { 'rebelot/kanagawa.nvim' },
    { 'nlknguyen/papercolor-theme' },
    { 'sainnhe/everforest' },
    { 'cocopon/iceberg.vim' },
    { 'junegunn/seoul256.vim' },
    { 'sainnhe/gruvbox-material' },
    { 'rose-pine/neovim' },
    { 'ku1ik/vim-monokai' },
    { 'sainnhe/sonokai' },
    { 'dracula/vim' },
    { 'navarasu/onedark.nvim' },
    { 'jacoborus/tender.vim' },
    { 'lifepillar/vim-solarized8' },
    { 'mhartington/oceanic-next' },
    { 'projekt0n/github-nvim-theme' },
    { 'ellisonleao/gruvbox.nvim' },
    { 'tomasiser/vim-code-dark' },
    { 'jnurmine/zenburn' },
    { 'romainl/apprentice' },
    { 'nyoom-engineering/oxocarbon.nvim' },
    { 'sainnhe/edge' },
    { 'raphamorim/lucario' },
}


-- ---------------------------------------

require("lazy").setup({
    COLOR_SCHEMES,
    SESSION,
    TELESCOPE,
    DATABASE,
    GIT,
    SNIPPETS,
    LSP,
    CMP,
    FILE_MOTIONS,
    UTILS,
    FOLKE,
    EDITING_SUPPORT,
    TMUX,
    STATUS_LINE,
    EDUCATION,
    ENTERTAIN,
    NOTE_TAKING
})
