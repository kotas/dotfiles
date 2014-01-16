if [ -z "$TMUX" -a -z "$STY" ]; then
    keychain $HOME/.ssh/id_rsa
    source $HOME/.keychain/${HOST}-sh
    exec tmuxx
fi
