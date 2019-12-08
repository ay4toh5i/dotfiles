# pure - zsh simple prompt (https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure

# Alias for mac
alias ls='ls -FG'
alias ll='ls -ahlFG'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULE=on

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fzfp="fzf --preview 'head -100 {}'"
