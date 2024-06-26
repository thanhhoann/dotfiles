if status is-interactive
    # eval (zellij setup --generate-auto-start fish | string collect) 
end

# EXPORTS
# ---------------------------------------------------------------

# commons
export HOMEBREW_NO_AUTO_UPDATE=1
export VISUAL=nvim
export EDITOR=nvim
export OPENAI_API_KEY="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"
export NODE_OPTIONS=--openssl-legacy-provider
export WALK_REMOVE_CMD=trash

# ranger
export FZF_FZM_OPTS="--reverse --height 75% --min-height 30 --cycle +m --ansi --bind=ctrl-o:accept,ctrl-t:toggle --select-1"
export FZF_DMARK_OPTS="--reverse --height 75% --min-height 30 --cycle -m --ansi --bind=ctrl-o:accept,ctrl-t:toggle"

# starship
# export STARSHIP_CONFIG=~/.config/starship/starship.toml

# nnn : file manager
set -x NNN_PLUG_PERSONAL 'g:personal/convert2zoom;p:personal/echo'
set -x NNN_PLUG_WORK 'j:work/prettyjson;d:work/foobar'
set -x NNN_PLUG_INLINE 'e:!go run "$nnn"*'
set -x NNN_PLUG_DEFAULT '1:ipinfo;p:preview-tui;o:fzz;b:nbak'
set -x NNN_PLUG "$NNN_PLUG_PERSONAL;$NNN_PLUG_WORK;$NNN_PLUG_DEFAULT;$NNN_PLUG_INLINE"

# nvm

# ALIAS
# ---------------------------------------------------------------
alias ls="exa --icons -F -H --group-directories-first --git -1"

# ABBREVIATIONS
# ---------------------------------------------------------------
# brew
abbr --add bs brew services
abbr --add bsa brew services start
abbr --add bso brew services stop
abbr --add bsr brew services restart


# vim 
abbr --add v env TERM=wezterm nvim

# tmux
abbr --add ta tmux attach

# ZELLIJ
abbr --add ze zellij

# exit
abbr --add x exit

# ranger
abbr --add r ranger

## tmux session manager
abbr --add tn "tmux new -s (pwd | sed 's/.*\///g')"

# trash cli
abbr --add rm trash

# money
abbr --add money node /Users/thanhhoann/core_machine/desktop/codiing/cli/monthly-finance/getMoneyCanSpend.js

# MTMR
abbr --add mtmr cd /Users/thanhhoann/Library/Application\ Support/MTMR

# PATHS : binary files
# ---------------------------------------------------------------

# flutter
fish_add_path $HOME/development/flutter/bin

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
    if test "$argv[1]" = fish
        cd ~/.config/fish
        nvim ~/.config/fish/config.fish

        # NEOVIM
    else if test "$argv[1]" = vim
        cd ~/.config/nvim
        nvim ~/.config/nvim

        # TMUX
    else if test "$argv[1]" = tmux
        nvim ~/.tmux.conf

        # KITTY
    else if test "$argv[1]" = kitty
        nvim ~/.config/kitty/kitty.conf

        # ALACRITTY
    else if test "$argv[1]" = alacritty
        nvim ~/.config/alacritty/alacritty.toml

        # ZELLIJ
    else if test "$argv[1]" = zellij
        cd ~/.config/zellij
        nvim ~/.config/zellij/config.kdl
    end
end

# ---------------------------

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# ---------------------------

function ff -d "Fix machine time"
    echo hoan | sudo -S sntp -S (sed -n '/^server/s/.* //p' /etc/ntp.conf)
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

# ---------------------------

function flutter_run
    tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \; \
        split-window -v \; \
        send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \; \
        select-pane -t 0 \;
end

# ---------------------------

function lk
    set loc (walk $argv); and cd $loc
end

# PLUGIN SETUP
# ---------------------------------------------------------------


# MISC
# ---------------------------------------------------------------

# set brew shell completions
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# STARTUP
# ---------------------------------------------------------------

# THEME
# ---------------------------------------------------------------

oh-my-posh init fish --config ~/.config/oh-my-posh/themes/thanhhoan.omp.json | source

# starship init fish | source

zoxide init fish | source
