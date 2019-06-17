# pure - zsh simple prompt (https://github.com/sindresorhus/pure)
autoload -U promptinit; promptinit
prompt pure

# Alias for mac
alias ls='ls -FG'
alias ll='ls -ahlFG'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

