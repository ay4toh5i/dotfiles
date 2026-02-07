# Specify emacs like key bindings(this necessary if $EDITOR is set to vi/vim)
bindkey -e

for i in $(/bin/ls $HOME/.zshrc.d/*.zsh | sort); do
	source $i
done

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# pgp
gpg-connect-agent /bye

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"
