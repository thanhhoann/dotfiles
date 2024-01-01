function SetRelavtiveNu(isRel)
    if isRel == true then
        vim.opt.relativenumber = true
    else
        vim.opt.relativenumber = false
    end
end

function SetColor(color, color_opts, isTransparent)
    color = color or "tokyodark"
    if color_opts == "none" then
        color_opts = "none"
        vim.cmd.colorscheme(color)
    else
        color_opts = ('-' .. color_opts)
        vim.cmd.colorscheme(color .. color_opts)
    end


    if isTransparent == true then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end
