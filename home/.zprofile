# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
export HISTSIZE=3000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks  
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history
setopt interactivecomments

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

zstyle ':completion:*:*:*:default' menu yes select search

# pgp
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
