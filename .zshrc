# Alias for mac
alias ls='ls -FG'
alias ll='ls -ahlFG'
alias tree='tree -L 2 -C'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

function checkout () {
  local result output selected

  result="1"
  output=$(git status 2>&1 > /dev/null)
  result=$?

  if [[ $result = "0" ]]; then
    selected=$(git branch | fzf --reverse --prompt "CHECKOUT " --height 40% --inline-info | tr -d " ")
    if [[ -n $selected ]]; then
      git checkout $selected
    fi
  else
    echo $output
  fi

  zle accept-and-hold
}

zle -N checkout
bindkey '^b' checkout

function changeDirectory() {
  cd $(fd -t d --hidden -d 3 | fzf --reverse --height 40% | sed -e 's/^/\.\//')
  zle accept-line
}

zle -N changeDirectory
bindkey '^l' changeDirectory

function cd2GitRepository() {
  cd $(ghq list --full-path | fzf --reverse)
  zle accept-line
}

zle -N cd2GitRepository
bindkey '^g' cd2GitRepository

export GO111MODULE=on

eval "$(starship init zsh)"

source /home/ayato/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# pgp
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent /bye
gpgconf --launch gpg-agent
