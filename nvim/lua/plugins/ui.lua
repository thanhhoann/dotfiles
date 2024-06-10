return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = { event = "notify", find = "No information available" },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, opts)
      local trouble = require("trouble")
      if not trouble.statusline then
        LazyVim.error("You have enabled the **trouble-v3** extra,\nbut still need to update it with `:Lazy`")
        return
      end

      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end,
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'tokyonight',
        }
      })
    end
  },
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
    ███        ▄█    █▄       ▄████████ ███▄▄▄▄      ▄█    █▄       ▄█    █▄     ▄██████▄     ▄████████ ███▄▄▄▄
▀█████████▄   ███    ███     ███    ███ ███▀▀▀██▄   ███    ███     ███    ███   ███    ███   ███    ███ ███▀▀▀██▄
   ▀███▀▀██   ███    ███     ███    ███ ███   ███   ███    ███     ███    ███   ███    ███   ███    ███ ███   ███
    ███   ▀  ▄███▄▄▄▄███▄▄   ███    ███ ███   ███  ▄███▄▄▄▄███▄▄  ▄███▄▄▄▄███▄▄ ███    ███   ███    ███ ███   ███
    ███     ▀▀███▀▀▀▀███▀  ▀███████████ ███   ███ ▀▀███▀▀▀▀███▀  ▀▀███▀▀▀▀███▀  ███    ███ ▀███████████ ███   ███
    ███       ███    ███     ███    ███ ███   ███   ███    ███     ███    ███   ███    ███   ███    ███ ███   ███
    ███       ███    ███     ███    ███ ███   ███   ███    ███     ███    ███   ███    ███   ███    ███ ███   ███
   ▄████▀     ███    █▀      ███    █▀   ▀█   █▀    ███    █▀      ███    █▀     ▀██████▀    ███    █▀   ▀█   █▀
]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config", icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
