source ~/dotfiles/home/antigen.zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zdharma-continuum/fast-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Instaill zsh plugins which are not managed by antigen
ZSH_PLUGINS=$HOME/.confg/.zshrc.d/plugins

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf-tab-completion plugin
if [[ ! -d "$ZSH_PLUGINS/fzf-tab-completion" ]]; then
  git clone --depth 1 https://github.com/lincheney/fzf-tab-completion "$ZSH_PLUGINS/fzf-tab-completion"
fi

if [[ -f "$ZSH_PLUGINS/fzf-tab-completion/zsh/fzf-zsh-completion.sh" ]]; then
  source $ZSH_PLUGINS/fzf-tab-completion/zsh/fzf-zsh-completion.sh
fi

# zeno plugin
if [[ ! -d "$ZSH_PLUGINS/zeno" ]]; then
  git clone --depth 1 https://github.com/yuki-yano/zeno.zsh.git "$ZSH_PLUGINS/zeno"
fi

if [[ -f "$ZSH_PLUGINS/zeno/zeno.zsh" ]]; then
  source $ZSH_PLUGINS/zeno/zeno.zsh
fi
