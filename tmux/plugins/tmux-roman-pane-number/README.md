# tmux Roman Numeral Pane Number
Display the current pane status number as a roman numeral.

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

in `.tmux.conf`:

    set -g @plugin 'xp-bar/tmux-roman-pane-number'

Hit `prefix + I` to fetch the plugin and source it.

Next, add `#{roman_pane_number}` to your `status-left` or `status-right` in `.tmux.conf`.
Enjoy!
