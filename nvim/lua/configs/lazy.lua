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

local COLOR_SCHEMES = {
    { "folke/tokyonight.nvim" },
    { "tiagovla/tokyodark.nvim" },
    { 'marko-cerovac/material.nvim' }
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

local LSP = {
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

    { 'ThePrimeagen/harpoon' },

    { 'tpope/vim-fugitive' },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },

    { 'epwalsh/obsidian.nvim' },

    -- TODO: add snippet
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" }
    },

    { "rafamadriz/friendly-snippets" },

    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    }

}

-- ---------------------------------------

local UTILS = {
    { 'nvim-tree/nvim-web-devicons' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "cpea2506/relative-toggle.nvim" },
    { "honza/vim-snippets" },
    { "MunifTanjim/nui.nvim" },
    { "karb94/neoscroll.nvim" },
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    { "numToStr/FTerm.nvim" },

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

    { -- https://github.com/rcarriga/nvim-notify/tree/master
        'rcarriga/nvim-notify'
    }
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
    {
        "gbprod/yanky.nvim",
        opts = {}
    },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'MunifTanjim/prettier.nvim' },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    { 'tpope/vim-surround' },

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
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    }

}

-- ---------------------------------------

local ENTERTAIN = {
    { 'eandrju/cellular-automaton.nvim' },
    { 'echasnovski/mini.nvim',          version = '*' },
}

-- ---------------------------------------

local STATUS_LINE = {
    {
        'nvim-lualine/lualine.nvim'
    }
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
    { 'renerocksai/telekasten.nvim' },
    { 'renerocksai/calendar-vim' },                  -- viewing calendar
    { 'nvim-lua/popup.nvim' },
    { 'nvim-telescope/telescope-media-files.nvim' }, -- viewing media files
    { 'cnshsliu/smp.nvim' },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- if you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- e.g. "bufreadpre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "bufreadpre path/to/my-vault/**.md",
        --   "bufnewfile path/to/my-vault/**.md",
        -- },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
        },
    },
}

-- ---------------------------------------

require("lazy").setup({
    COLOR_SCHEMES,
    SESSION,
    DATABASE,
    LSP,
    UTILS,
    FOLKE,
    EDITING_SUPPORT,
    TMUX,
    STATUS_LINE,
    EDUCATION,
    ENTERTAIN,
    NOTE_TAKING
})
