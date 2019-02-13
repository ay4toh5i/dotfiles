#!/bin/bash

echo "Installing..."

echo "Deploying dotfiles.."

for file in .??* 
do

  [[ ${file} == ".git" ]] && continue
  [[ ${file} == ".gitignore" ]] && continue
	ln -snfv ${HOME}/dotfiles/${file} ${HOME}/${file}
	echo $file

done
