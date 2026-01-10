eval "$(/opt/homebrew/bin/brew shellenv)"

GPG_TTY="$(tty)"
export GPG_TTY

SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
