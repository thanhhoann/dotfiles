require("utils.nui-component")
local M = {}

function M.source_plugin(plugin_name)
	require("customs.configs." .. plugin_name)
end

return M
