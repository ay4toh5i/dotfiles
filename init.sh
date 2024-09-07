#!/bin/bash

set -u

DOT_DIRECTORY="${HOME}/dotfiles"
GITHUB_URL="https://github.com/ay4toh5i/dotfiles"

# is_exists returns true if ececutable $1 exists in $PATH
is_exists() {
  type "$1" >/dev/null 2>&1
  return $?
}

# has is wrapper function
has() {
  is_exists "$@"
}

e_error() {
  printf "error with $*" 1>&2
}

# die returns exit code error and echo error message
die() {
  e_error "$1" 1>&2
  exit "{$2:-1}"
}

if [ ! -d ${DOT_DIRECTORY} ]; then
  echo "Installing..."

  if has "git"; then
    git clone --recursive ${GITHUB_URL} ${DOT_DIRECTORY}

  elif has "curl" || has "wget"; then
    tarball="https://github.com/HighGreat/dotfiles/archive/master.tar.gz"

    if has "curl"; then
      curl -L ${tarball}

    elif has "wget"; then
      wget -O - ${tarball}

    fi | tar xvz 

    mv -f dotfiles-master ${DOT_DIRECTORY}

  else
    die "curl or wget required"
  fi
fi

cd ${DOT_DIRECTORY}
if [ $? -ne 0 ]; then
  die "not found: ${DOT_DIRECTORY}"
fi

echo "Deploying dotfiles.."

while read -r path; do
  basedir=$(dirname ${path})

  if [ $basedir != "." ] && [ ! -d "${HOME}/${basedir#\./}" ]; then
    mkdir -p "${HOME}/${basedir#\./}"
  fi

  ln -snfv "${DOT_DIRECTORY}/${path#\./}" "${HOME}/${path#\./}"
done < <(find . -type f -not -path '*/\.git/*' -not -name '\.gitignore' -not -name 'README.md')

# install zsh  plugin manger
curl -L git.io/antigen > antigen.zsh
