return {
  -- wrap and unwrap functions
  {
    "Wansmer/treesj",
    keys = { "<leader>zz", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({})
    end,
  },

  -- Add/change/delete surrounding delimiter pairs with ease.
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Auto insert next pair
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Search & Replact | Visual Selection
  { "chrisgrieser/nvim-rip-substitute", cmd = "RipSubstitute" },

  -- crs snake_case
  -- crm MixedCase
  -- crc camelCase
  -- cru UPPER_CASE
  -- cr- dash-case
  -- cr.dot.case
  { "tpope/vim-abolish" },
}
