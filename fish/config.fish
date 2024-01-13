if status is-interactive
    # Commands to run in interactive sessions can go here
end

# EXPORTS
# ---------------------------------------------------------------

# brew
export HOMEBREW_NO_AUTO_UPDATE=1

# ABBREVIATIONS
# ---------------------------------------------------------------

# vim
abbr --add v nvim

# tmux session manager
abbr --add tn "tmux new -s (pwd | sed 's/.*\///g')"

# trash cli
abbr --add rm trash

abbr --add money node /Users/thanhhoann/core_machine/desktop/codiing/cli/monthly-finance/getMoneyCanSpend.js

# ls
abbr --add ls eza --color=auto --icons=auto -F -l --no-user --no-permissions --total-size --bytes --group-directories-first --tree
# ls all
abbr --add lsa eza --color=auto --icons=auto -F -a -a -l --no-user --no-permissions --total-size --bytes --group-directories-first
# ls  files - dirs
abbr --add lsf eza --color=auto --icons=auto -F -a -a -l --no-user --no-permissions --total-size --bytes --group-directories-first --only-files
abbr --add lsd eza --color=auto --icons=auto -F -a -a -l --no-user --no-permissions --total-size --bytes --group-directories-first --only-dirs

# PATHS : binary files
# ---------------------------------------------------------------

# flutter
fish_add_path /Users/thanhhoann/flutter/bin $PATH

# go 
fish_add_path $HOME/go/bin

# ~/.tmux/plugins
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
# ~/.config/tmux/plugins
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin

# DEFAULTS
# ---------------------------------------------------------------


# FUNCTIONS
# ---------------------------------------------------------------

function config
   
 # FISH
    if test "$argv[1]" = "fish"
        cd ~/.config/fish
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

function ff -d "Fix machine time"
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


echo ''

# THEME
# ---------------------------------------------------------------

oh-my-posh init fish --config ~/.config/oh-my-posh/themes/amro.omp.json | source

zoxide init fish | source
