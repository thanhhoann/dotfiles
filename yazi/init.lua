require("full-border"):setup()
-- require("starship"):setup()
require("omp"):setup()

require("searchjump"):setup({
	opt_unmatch_fg = "#928374",
	opt_match_str_fg = "#000000",
	opt_match_str_bg = "#73AC3A",
	opt_lable_fg = "#EADFC8",
	opt_lable_bg = "#BA603D",
	opt_only_current = false, -- only search the current window
	opt_search_patterns = {}, -- demo:{"%.e%d+","s%d+e%d+"}
})
