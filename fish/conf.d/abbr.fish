# ~/.config/fish/conf.d/abbr.fish
if not set -q MY_ABBR_SET
    set -U MY_ABBR_SET true
    abbr -a v nvim
    abbr -a zz exit

    abbr -a studies ~/core_machine/desktop/studies/

end
