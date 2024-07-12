local cmp = require("cmp")
cmp.setup({
  formatting = {
    format = require("lspkind").cmp_format({
      mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- can also be a function to dynamically calculate max width such as
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
      symbol_map = { Codeium = "" },
    }),
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    {
      name = "nvim_lsp",
      option = {
        markdown_oxide = {
          keyword_pattern = [[\(\k\| \|\/\|#\)\+]],
        },
      },
    },
    { name = "codeium" },
    {
      name = "async_path",
      option = {
        trailing_slash = true,
        show_hidden_files_by_default = true,
      },
    },
    -- { name = "cmp-tw2css" }, -- tailwindcss in css files
    {
      name = "tmux",
      option = {
        -- Source from all panes in session instead of adjacent panes
        all_panes = false,

        -- Completion popup label
        label = "[tmux]",

        -- Trigger character
        trigger_characters = { "." },

        -- Specify trigger characters for filetype(s)
        -- { filetype = { '.' } }
        trigger_characters_ft = {},

        -- Keyword patch mattern
        keyword_pattern = [[\w\+]],

        -- Capture full pane history
        -- `false`: show completion suggestion from text in the visible pane (default)
        -- `true`: show completion suggestion from text starting from the beginning of the pane history.
        --         This works by passing `-S -` flag to `tmux capture-pane` command. See `man tmux` for details.
        capture_history = false,
      },
    },
  }),
})
