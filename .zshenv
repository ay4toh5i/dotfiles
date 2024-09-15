export GOPATH=$HOME/.go
export GO111MODULE=on
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
