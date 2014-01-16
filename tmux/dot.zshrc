# tmux
if [ "$TMUX" != "" -a "$(tmux -V)" != "tmux 1.6" ]; then
    # Avoid this hack when using old version of tmux (due to the bug that hangs up the terminal)
    function show-current-dir-as-window-name() {
        tmux set-window-option window-status-current-format "#[bg=colour26,fg=black] #I#F #[default] #W /${PWD:t} " >/dev/null
        tmux set-window-option window-status-format "#[fg=blue]#I#F#[default] #W /${PWD:t}" >/dev/null
    }
    function chpwd() {
        show-current-dir-as-window-name
        ls
    }
    show-current-dir-as-window-name
fi
