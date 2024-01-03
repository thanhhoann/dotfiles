-- reference : https://muniftanjim.dev/blog/neovim-build-ui-using-nui-nvim/

local Input = require("nui.input")
local Event = require("nui.utils.autocmd").event

local function nui_lsp_rename()
    local current_name = vim.fn.expand("<cword>")
    local lsp_params = vim.lsp.util.make_position_params()

    local function onSubmit(new_name)
        if not new_name or #new_name == 0 or current_name == new_name then
            -- do nothing if `new_name` is empty or not changed.
            return
        end

        -- add `newName` property to `params`.
        -- this is needed for making `textDocument/rename` request.
        lsp_params.newName = new_name

        -- send the `textDocument/rename` request to LSP server
        vim.lsp.buf_request(0, "textDocument/rename", lsp_params, function(_, result, ctx, _)
            if not result then
                -- do nothing if server returns empty result
                return
            end

            -- the `result` contains all the places we need to update the
            -- name of the identifier. so we apply those edits.
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
            -- after the edits are applied, the files are not saved automatically.
            -- let's remind ourselves to save those...
            local total_files = vim.tbl_count(result.changes)
            print(
                string.format(
                    "Changed %s file%s. To save them run ':wa'",
                    total_files,
                    total_files > 1 and "s" or ""
                )
            )
        end)
    end

    local popup_options = {
        -- border for the window
        border = {
            style = "rounded",
            text = {
                top = "[Rename]",
                top_align = "left"
            },
        },
        -- highlight for the window.
        highlight = "Normal:Normal",
        -- place the popup window relative to the
        -- buffer position of the identifier
        relative = {
            type = "buf",
            position = {
                -- this is the same `params` we got earlier
                row = lsp_params.position.line,
                col = lsp_params.position.character,
            }
        },
        -- position the popup window on the line below identifier
        position = {
            row = 1,
            col = 0,
        },
        -- 25 cells wide, should be enough for most identifier names
        size = {
            width = 25,
            height = 1,
        },
    }
    local input = Input(popup_options, {
        -- set the default value to current name
        default_value = current_name,
        -- pass the `on_submit` callback function we wrote earlier
        on_submit = onSubmit,
        prompt = "",
    })

    input:mount()

    -- close on <esc> in normal mode
    input:map("n", "<Esc>", input.input_props.on_close, { noremap = true })

    -- close when cursor leaves the buffer
    input:on(Event.BufLeave, input.input_props.on_close, { once = true })
end

return {
    lsp_rename = nui_lsp_rename,
}
