function ver --argument program
    if contains $program ssh tmux
        $program -V
    else if contains $program java
        $program -version
    else if contains $program vi vim
        # vim version info is way too verbose
        vi --version | take 1
    else
        $program --version
    end
end
