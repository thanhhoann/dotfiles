if status is-interactive
end


# PROMPT

# ---------------------------------------------------------------
# ABBREVIATIONS

# brew
abbr --add brew_install_no_update HOMEBREW_NO_AUTO_UPDATE=1 brew install

# vim
abbr --add v nvim

# ---------------------------------------------------------------
# PATHS

set -gx PATH /usr/local/bin $PATH
set -x PATH /Users/thanhhoann/flutter/bin $PATH

# ---------------------------------------------------------------
# DEFAULTS

set -x BROWSER "brave"

# ---------------------------------------------------------------
# FUNCTIONS

function config
    # FISH
    if test "$argv[1]" = "fish"
        nvim ~/.config/fish/config.fish
    # NEOVIM
    else if test "$argv[1]" = "nvim"
        nvim ~/.config/nvim
    # TMUX
    else if test "$argv[1]" = "tmux"
        nvim ~/.tmux.conf
    end
end

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

# ---------------------------------------------------------------

# STARTUP

echo ''

# nodejs
nvm_start




