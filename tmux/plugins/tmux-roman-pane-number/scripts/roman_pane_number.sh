#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

roman_pane_number() {
   print_roman "$(tmux display-message -p | grep -E -o 'current pane [0-9]*' | grep -E -o '[0-9]+')"
}

roman_pane_number
