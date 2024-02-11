local cmp = require("cmp")

-- cmp-cmdline
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

-- cmp-fonts
-- Only enable `fonts` for only * file types
cmp.setup.filetype({ "conf", "config", "toml" },
    { sources = { { name = "fonts" } } })
