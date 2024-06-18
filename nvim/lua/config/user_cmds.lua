-- • name: (string) Command name
-- • args: (string) The args passed to the command, if any
--   <args>
-- • fargs: (table) The args split by unescaped whitespace
--   (when more than one argument is allowed), if any <f-args>
-- • nargs: (string) Number of arguments |:command-nargs|
-- • bang: (boolean) "true" if the command was executed with a
--   ! modifier <bang>
-- • line1: (number) The starting line of the command range
--   <line1>
-- • line2: (number) The final line of the command range
--   <line2>
-- • range: (number) The number of items in the command range:
--   0, 1, or 2 <range>
-- • count: (number) Any count supplied <count>
-- • reg: (string) The optional register, if specified <reg>
-- • mods: (string) Command modifiers, if any <mods>
-- • smods: (table) Command modifiers in a structured format.
--   Has the same structure as the "mods" key of
--   |nvim_parse_cmd()|.
--
-- nvim.cmd() send keys to tmux pane
-- (example) :exe "!tmux send -t 2 'echo " . line(".") . "' Enter"

-- PNPM Install
vim.api.nvim_create_user_command("PNPMInstall", function()
  local tmux_cmd = "pnpm add " .. package
  local term_cmd = '"' .. "!tmux send -t 2 " .. "'" .. tmux_cmd .. "' Enter" .. '"'
  vim.cmd("exec " .. term_cmd)
end, { bang = true })

-- Hello world example
vim.api.nvim_create_user_command("SayHello", 'echo "Hello world!"', { bang = true, nargs = "?" })

-- example
vim.api.nvim_create_user_command("Do", function(opts)
  print(opts.args)
  -- print(string.upper(opts.args))
end, { nargs = 1 })
