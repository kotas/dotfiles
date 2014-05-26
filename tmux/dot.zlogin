if [ -z "$TMUX" -a -z "$STY" ] && which tmuxx >/dev/null 2>&1; then
    keychain $HOME/.ssh/id_rsa
    source $HOME/.keychain/${HOST}-sh
    exec tmuxx
fi
