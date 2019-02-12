#!/bin/bash

echo "hello console"

for file in ./.??* 
do
  [ ${file}=".git" ] && continue
  [ ${file}=".gitignore" ] && continue
	ln -snfv ${HOME}/dotfiles/${file} ${HOME}/${file}
	echo "${file}"
done
