local Technical = require("plugins.nui.nui_goals.components.technical")

vim.keymap.set("n", "<leader>m", function()
  Technical:mount()
end, { noremap = true })
