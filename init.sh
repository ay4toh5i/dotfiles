#!/bin/bash

set -u

DOT_DIRECTORY="${HOME}/dotfiles"
GITHUB_URL="https://github.com/HighGreat/dotfiles"

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

echo "Installing..."

if has "git"; then
  git clone --recursive ${GITHUB_URL} ${DOT_DIRECTORY}

elif has "curl" || has "wget"; then
  tarball="https://github.com/HighGreat/dotfiles/archive/master.tar.gz"

  if has "curl"; then
    curl -L ${tarball}

  elif has "wget"; then
    wget -O - ${tarball}

  fi | tar xv -

  mv -f dotfiles-master ${DOT_DIRECTORY}

else
  die "curl or wget required"
fi

cd ${DOT_DIRECTORY}
if [ $? -ne 0 ]; then
  die "not found: ${DOT_DIRECTORY}"
fi

echo "Deploying dotfiles.."

for file in .??* 
do

  [[ ${file} == ".git" ]] && continue
  [[ ${file} == ".gitignore" ]] && continue
	ln -snfv "${DOT_DIRECTORY}/${file}" "${HOME}/${file}"

done
