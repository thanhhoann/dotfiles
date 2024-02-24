function SetRelavtiveNu(isRel)
    if isRel == true then
        vim.opt.relativenumber = true
    else
        vim.opt.relativenumber = false
    end
end

