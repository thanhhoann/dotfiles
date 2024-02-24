vim.g.nightflyCursorColor = true
vim.g.nightflyItalics = true
vim.g.nightflyTerminalColors = true
vim.g.nightflyTransparent = true
vim.g.nightflyUndercurls = true
vim.g.nightflyUnderlineMatchParen = true
vim.g.nightflyVirtualTextColor = true
vim.g.nightflyWinSeparator = 2
vim.opt.fillchars = {
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
}

-- floats
vim.g.nightflyNormalFloat = true
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = "single"
    }
)
vim.diagnostic.config({ float = { border = "single" } })

local winhighlight = {
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}
require('cmp').setup({
    window = {
        completion = require 'cmp'.config.window.bordered(winhighlight),
        documentation = require 'cmp'.config.window.bordered(winhighlight),
    }
})

-- highlight functions in bold
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "nightfly",
    callback = function()
        vim.api.nvim_set_hl(0, "Function", { fg = "#82aaff", bold = true })
    end,
    group = custom_highlight,
})
