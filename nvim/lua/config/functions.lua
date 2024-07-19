function _G.custom_notify(command, message, level, title, time_out, icon, render_style)
  return command
    .. "<cmd>lua require('notify')('"
    .. " "
    .. message
    .. "', '"
    .. level
    .. "', {title='"
    .. title
    .. "', timeout='"
    .. time_out
    .. "', icon='"
    .. icon
    .. "', render='"
    .. render_style
    .. "'})<cr>"
end

function _G.set_colorscheme(name)
  -- loads custom config
  require("plugins.config.colorschemes." .. name)
  -- set via vim.cmd
  vim.cmd("colorscheme" .. " " .. name)
end
