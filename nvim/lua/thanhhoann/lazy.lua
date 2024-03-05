local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable',
        lazypath })
end
vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
    --          ╭─────────────────────────────────────────────────────────╮
    --          │                           CMP                           │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CmdlineEnter' },
        dependencies = { 'L3MON4D3/LuaSnip' },
    },
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
    { "zbirenbaum/copilot-cmp",   config = function() require("copilot_cmp").setup() end },


    --          ╭─────────────────────────────────────────────────────────╮
    --          │                           AI                            │
    --          ╰─────────────────────────────────────────────────────────╯
    -- { 'github/copilot.vim' },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- },
    {
        'Exafunction/codeium.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp' },
        config = function() require('codeium').setup({}) end
    },
    -- {
    --     "robitx/gp.nvim",
    --     config = function()
    --         require("gp").setup()
    --     end,
    -- },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       DEVELOPMENT                       │
    --          ╰─────────────────────────────────────────────────────────╯
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

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                          DEBUG                          │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                         SNIPPETS                         │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'L3MON4D3/LuaSnip',            dependencies = { 'rafamadriz/friendly-snippets' } },
    { 'honza/vim-snippets' },
    { 'rafamadriz/friendly-snippets' },
    {
        "chrisgrieser/nvim-scissors",
        dependencies = "nvim-telescope/telescope.nvim", -- optional
        opts = {
            snippetDir = "~/.config/nvim/snippets",
        }
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                           GIT                           │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",      -- optional
        },
        config = true
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       TREESITTER                        │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'nvim-treesitter/nvim-treesitter',            build = ':TSUpdate' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                           LSP                           │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'neovim/nvim-lspconfig' },
    { 'VonHeikemen/lsp-zero.nvim',                  branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- sources
    { 'onsails/lspkind.nvim' },
    -- { 'lvimuser/lsp-inlayhints.nvim' },
    { 'folke/lsp-colors.nvim' },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }
    },
    -- hover.diagnostic.
    -- {
    --     "soulis-1256/eagle.nvim",
    --     config = function()
    --         require 'eagle'.setup()
    --     end
    -- },
    {
        "lvimuser/lsp-inlayhints.nvim",
        branch = "anticonceal",
        event = "LspAttach",
        opts = {},
        config = function(_, opts)
            require("lsp-inlayhints").setup(opts)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
                callback = function(args)
                    if not (args.data and args.data.client_id) then
                        return
                    end
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require("lsp-inlayhints").on_attach(client, args.buf)
                end,
            })
        end,
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                        DATABASE                         │
    --          ╰─────────────────────────────────────────────────────────╯
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

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                        TELESCOPE                        │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'nvim-telescope/telescope.nvim',               tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' } },
    -- sources
    -- { 'debugloop/telescope-undo.nvim' },
    { 'MaximilianLloyd/adjacent.nvim' }, -- find files in same dir
    { 'tsakirist/telescope-lazy.nvim' },
    { 'octarect/telescope-menu.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = { { 'nvim-telescope/telescope.nvim' } },
        config = function() require('neoclip').setup() end,
    },
    -- {
    --     'gnikdroy/projections.nvim',
    --     config = function()
    --         require 'projections'.setup({
    --             workspaces = {
    --                 { '~/.config/nvim/', {} }
    --             }
    --         })
    --     end
    -- },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                           _UI                            │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'MunifTanjim/nui.nvim' },
    { 'goolord/alpha-nvim',  dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'j-hui/fidget.nvim' },
    { 'rcarriga/nvim-notify' },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    { 'xiyaowong/transparent.nvim' },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                      FILE_MOTIONS                       │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'stevearc/oil.nvim',         opts = {},           dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { 'ThePrimeagen/harpoon',      branch = 'harpoon2', dependencies = { 'nvim-lua/plenary.nvim' } },
    { 'kevinhwang91/rnvimr' },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                         WINDOWS                         │
    --          ╰─────────────────────────────────────────────────────────╯
    { "nvim-zh/colorful-winsep.nvim", config = true,                              event = { "WinNew" } }, -- window separator
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

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                          _UTILS                          │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    { 'folke/todo-comments.nvim',     dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
    { 'nvimtools/none-ls.nvim' }, -- null-ls alternative
    {
        'gen740/SmoothCursor.nvim',
        config = function()
            require('smoothcursor').setup()
        end
    },

    { 'mrjones2014/legendary.nvim', priority = 10000, lazy = false },
    { "stefanlogue/hydrate.nvim",   version = "*",    opts = {} },
    { 'itchyny/calendar.vim' },
    {
        "chrishrb/gx.nvim",
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        init = function()
            vim.g.netrw_nogx = 1 -- disable netrw gx
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
        submodules = false, -- not needed, submodules are required only for tests
        config = true
    },
    { 'mbbill/undotree' },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                     _EDITING SUPPORT                     │
    --          ╰─────────────────────────────────────────────────────────╯
    { 'windwp/nvim-autopairs',        event = 'InsertEnter',                                  opts = {} },
    { 'windwp/nvim-ts-autotag' },
    { 'cpea2506/relative-toggle.nvim' },
    { 'numToStr/Comment.nvim',        opts = {},                                              lazy = false },
    { 'terrortylor/nvim-comment',     config = function() require('nvim_comment').setup() end }, -- for keymapping
    { "LudoPinelli/comment-box.nvim" },                                                          -- commentstring drawings
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
    {
        'chrisgrieser/nvim-spider',
        lazy = true,
        keys = {
            { 'w', "<cmd>lua require('spider').motion('w')<cr>", mode = { 'n', 'x', 'o' }, desc = "Spider W" },
            { 'e', "<cmd>lua require('spider').motion('e')<cr>", mode = { 'n', 'x', 'o' }, desc = "Spider E" },
            { 'b', "<cmd>lua require('spider').motion('b')<cr>", mode = { 'n', 'x', 'o' }, desc = "Spider B" },
        },
    },
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
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })

            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
            vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
            -- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
        end
    },
    { 'tpope/vim-sleuth' },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                        _EDUCATION                        │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        'kawre/leetcode.nvim',
        build = ':TSUpdate html',
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },
    {
        "epwalsh/pomo.nvim",
        version = "*",
        event = "VeryLazy",
        cmd = { "TimerStart", "TimerRepeat" },
        dependencies = { "rcarriga/nvim-notify" },
        opts = {},
    },
    {
        "TobinPalmer/Tip.nvim",
        event = "VimEnter",
        init = function()
            -- Default config
            --- @type Tip.config
            require("tip").setup({
                seconds = 5,
                title = "⭐ Tip ⭐",
                url = "https://vtip.43z.one",
                -- url = "https://vimiscool.tech/neotip"
            })
        end,
    },
    {
        "roobert/surround-ui.nvim",
        dependencies = {
            "kylechui/nvim-surround",
            "folke/which-key.nvim",
        },
        config = function()
            require("surround-ui").setup({
                root_key = "S"
            })
        end,
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       STATUS LINE                       │
    --          ╰─────────────────────────────────────────────────────────╯
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
        event = 'VeryLazy',
    },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                      COLORSCHEMES                       │
    --          ╰─────────────────────────────────────────────────────────╯
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
    { 'oxfist/night-owl.nvim' },
    { "bluz71/vim-nightfly-colors" },
    { "tiagovla/tokyodark.nvim" },
    { "zootedb0t/citruszest.nvim" },
    { "sekke276/dark_flat.nvim" },
    { 'dasupradyumna/midnight.nvim', lazy = false,                                        priority = 1000 },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                       _NOTE TAKING                       │
    --          ╰─────────────────────────────────────────────────────────╯
    { "epwalsh/obsidian.nvim",       version = "*",                                       lazy = true,    dependencies = { "nvim-lua/plenary.nvim" } },
    { 'godlygeek/tabular' },
    { 'preservim/vim-markdown' },
    { 'AckslD/nvim-FeMaco.lua',      config = function() require('femaco').setup() end },
    { 'NFrid/due.nvim',              config = function() require('due_nvim').setup {} end },
    -- { -- translate markdown to mindmap
    --     "Zeioth/markmap.nvim",
    --     build = "yarn global add markmap-cli",
    --     cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
    --     opts = {
    --         html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
    --         hide_toolbar = false,      -- (default)
    --         grace_period = 3600000     -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    --     },
    --     config = function(_, opts) require("markmap").setup(opts) end
    -- },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                         COLORS                          │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        "max397574/colortils.nvim",
        cmd = "Colortils",
        config = function()
            require("colortils").setup()
        end,
    },
    { 'brenoprata10/nvim-highlight-colors', config = function() require('nvim-highlight-colors').setup({}) end },

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                          misc                           │
    --          ╰─────────────────────────────────────────────────────────╯
    {
        'eandrju/cellular-automaton.nvim'
    }
})
