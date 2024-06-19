local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local technical = Menu({
  position = "50%",
  size = {
    width = 40,
    height = 20,
  },
  border = {
    style = "rounded",
    text = {
      top = " [2024] Technical Goals ",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  lines = {
    Menu.separator(" Learns ", {
      char = ".",
      text_align = "center",
    }),
    Menu.item(" Data Structures & Algorigthms"),
    Menu.item(" Docker"),
    Menu.item(" Flutter"),

    Menu.separator(" Ideas ", {
      char = ".",
      text_align = "center",
    }),
    Menu.item(" Portfolio"),
    Menu.item(" Todo List"),
    Menu.item(" Personal Finance Tracker"),
    Menu.item(" Algorithms Visualizer"),
    Menu.item(" Web3 Ecommerce"),
    Menu.item(" Social Media"),
    Menu.item(" Realtime Chat App"),
    Menu.item(" Realtime Location Tracker"),
    Menu.item(" Realtime Editor (like Notion)"),

    Menu.separator(" My Own X ", {
      char = ".",
      text_align = "center",
    }),
    Menu.item(" My Own Redis"),
    Menu.item(" My Own Git"),
    Menu.item(" My Own Programming Language"),
    Menu.item(" My Own UI Library"),
    Menu.item(" My Own Chat Bot"),
  },
  max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>", "q" },
    -- submit = { "<CR>", "<Space>" },
  },
  on_close = function()
    print("Menu Closed!")
  end,
  -- on_submit = function(item)
  --   print("Menu Submitted: ", item.text)
  -- end,
})

return technical

