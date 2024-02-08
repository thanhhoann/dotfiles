#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

roman_interpolation="\#{roman_pane_number}"
roman_pane_number="#($CURRENT_DIR/scripts/roman_pane_number.sh)"

do_interpolation() {
    local input=$1
    local result=""

    result=${input/$roman_interpolation/$roman_pane_number}

    echo $result
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
	update_tmux_option "status-left"
}
main
