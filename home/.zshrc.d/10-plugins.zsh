source ~/dotfiles/home/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle olets/zsh-abbr@main
antigen apply

# Instaill zsh plugins which are not managed by antigen
ZSH_PLUGINS=$HOME/.confg/.zshrc.d/plugins

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
