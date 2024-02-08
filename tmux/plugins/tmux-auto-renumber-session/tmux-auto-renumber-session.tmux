#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux set-hook -g session-created "run $CURRENT_DIR/scripts/renumber-session.sh"
tmux set-hook -g session-renamed "run $CURRENT_DIR/scripts/renumber-session.sh"
tmux set-hook -g session-closed  "run $CURRENT_DIR/scripts/renumber-session.sh"
