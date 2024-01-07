if status is-interactive
end

# ABBREVIATIONS
# ---------------------------------------------------------------

# brew
abbr --add breww HOMEBREW_NO_AUTO_UPDATE=1 brew

# vim
abbr --add v nvim

# tmux session manager
abbr --add tn "tmux new -s (pwd | sed 's/.*\///g')"
# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

abbr --add rm trash

# PATHS
# ---------------------------------------------------------------

set -x PATH /Users/thanhhoann/flutter/bin $PATH

# DEFAULTS
# ---------------------------------------------------------------


# FUNCTIONS
# ---------------------------------------------------------------

function config
    # FISH
    if test "$argv[1]" = "fish"
        nvim ~/.config/fish/config.fish

    # NEOVIM
    else if test "$argv[1]" = "vim"
        cd ~/.config/nvim
        nvim ~/.config/nvim

    # TMUX
    else if test "$argv[1]" = "tmux"
        nvim ~/.tmux.conf

    # KITTY
    else if test "$argv[1]" = "kitty"
        nvim ~/.config/kitty/kitty.conf

    # ALACRITTY
    else if test "$argv[1]" = "alacritty"
        nvim ~/.config/alacritty/alacritty.toml

    # ZELLIJ
    else if test "$argv[1]" = "zellij"
        cd ~/.config/zellij
        nvim ~/.config/zellij/config.kdl
    end
end

# ---------------------------


# ---------------------------

function fx -d "Fix machine time"
    echo 'hoan' | sudo -S sntp -S (sed -n '/^server/s/.* //p' /etc/ntp.conf)
end

# ---------------------------

function mkdir -d "Create a directory and set current working directory"
    command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
            case '-*'

            case '*'
                cd $argv[(count $argv)]
                return
        end
    end
end

# ---------------------------

function nvm_start
    nvm use 20 -s
    # if test $status = 0
    # echo 'Node.js : ✅'
    # end
end

# PLUGIN SETUP
# ---------------------------------------------------------------


# STARTUP
# ---------------------------------------------------------------

# nodejs
nvm_start

echo ''

# THEME
# ---------------------------------------------------------------

# TokyoNight

# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 283457
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# starship init fish | source
oh-my-posh init fish --config ~/.config/oh-my-posh/themes/amro.omp.json | source

