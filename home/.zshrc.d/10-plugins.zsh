source ~/dotfiles/home/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Instaill zsh plugins which are not managed by antigen
ZSH_PLUGINS=$HOME/.confg/.zshrc.d/plugins

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ ! -d "$ZSH_PLUGINS/zeno" ]]; then
  git clone --depth 1 https://github.com/yuki-yano/zeno.zsh.git "$ZSH_PLUGINS/zeno"
fi

# Load zeno.zsh plugin If zno.zsh exists
if [[ -f "$ZSH_PLUGINS/zeno/zeno.zsh" ]]; then
  source $ZSH_PLUGINS/zeno/zeno.zsh
fi
