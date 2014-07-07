function peco-select-history() {
    BUFFER=$(
        \history -n 1 | \
        tail -r | \
        ruby -rset -e 's = Set.new; STDIN.each_line { |l| s.add?(l.strip) && puts(l) }' | \
        peco --query "$LBUFFER"
    )
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
