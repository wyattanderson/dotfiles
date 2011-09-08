#!/bin/bash
for file in vimrc gvimrc vim bash_profile bashrc bash_completion.d; do
   if [ -e ~/.${file} ] && [ ! -h ~/.${file} ]; then
      read -p "Move existing $file to ${file}_old? " -n 1
      if [[ $REPLY =~ ^[Yy]$ ]]; then
         echo "\n";
         mv ~/.${file} ~/.${file}_old
      fi
   fi
   ln -s ~/dotfiles/${file} ~/.${file}
done
