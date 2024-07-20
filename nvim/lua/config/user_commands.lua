local createUserCommand = vim.api.nvim_create_user_command

-- PNPM Install
createUserCommand("PNPMInstall", function()
  local tmux_cmd = "pnpm add " .. package
  local term_cmd = '"' .. "!tmux send -t 2 " .. "'" .. tmux_cmd .. "' Enter" .. '"'
  vim.cmd("exec " .. term_cmd)
end, { bang = true })

-- Hello world example
createUserCommand("SayHello", 'echo "Hello world!"', { bang = true, nargs = "?" })

-- example
createUserCommand("Do", function(opts)
  print(opts.args)
  -- print(string.upper(opts.args))
end, { nargs = 1 })

-- Format w conform.nvimk
createUserCommand("Format", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

-- Toggle text wrap
createUserCommand("ToggleWrap", function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    print("Changed Option: set")
  else
    vim.wo.wrap = true
    print("Changed Option: unset")
  end
end, {})

createUserCommand("ToggleOption", function(opts)
  local option = opts.args

  if option == "wrap" then
    if vim.wo.wrap then
      vim.wo.wrap = false
      print("Changed Option: wrap unset")
    else
      vim.wo.wrap = true
      print("Changed Option: wrap set")
    end
  elseif option == "spell" then
    if vim.wo.spell then
      vim.wo.spell = false
      print("Changed Option: spell unset")
    else
      vim.wo.spell = true
      print("Changed Option: spell set")
    end
  else
    print("Invalid option. Use 'wrap' or 'spell'.")
  end
end, { nargs = 1 }) -- This specifies that the command takes one argument
