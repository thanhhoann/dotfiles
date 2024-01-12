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
    { 'zaldih/themery.nvim' }, -- theme picker update realtime
    -- LIST OF 41 POPULAR THEMES
    -- https://github.com/linrongbin16/colorbox.nvim/blob/main/COLORSCHEMES.md
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

local CMP = {
    {
        'hrsh7th/nvim-cmp',
        event = { "InsertEnter", "CmdlineEnter" },
    },

    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-cmdline' },
    { 'dcampos/cmp-snippy' },
    { 'mtoohey31/cmp-fish' },

    { 'dcampos/nvim-snippy' },
    {'amarakon/nvim-cmp-fonts'}
}

-- ---------------------------------------

local LSP = {
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

    { 'tpope/vim-fugitive' },

    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },

    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    },

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
    -- {'jonarrien/telescope-cmdline.nvim'},
}

-- ---------------------------------------

local UTILS = {
    { 'nvim-tree/nvim-web-devicons' },
    { 'ThePrimeagen/harpoon' },

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
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --         { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --         { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --         { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    --     },
    -- },
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    {
        "folke/twilight.nvim",
        opts = {}
    }

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
    -- { 'renerocksai/telekasten.nvim' },
    -- { 'renerocksai/calendar-vim' },                  -- viewing calendar
    -- { 'nvim-lua/popup.nvim' },
    -- { 'nvim-telescope/telescope-media-files.nvim' }, -- viewing media files
    -- { 'cnshsliu/smp.nvim' },
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
    TELESCOPE,
    DATABASE,
    LSP,
    CMP,
    UTILS,
    FOLKE,
    EDITING_SUPPORT,
    TMUX,
    STATUS_LINE,
    EDUCATION,
    ENTERTAIN,
    NOTE_TAKING
})
