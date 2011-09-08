#!/bin/bash

# Iterate over the list of setup files we want to alias from our dotfile
# distribution
for file in vimrc gvimrc vim bash_profile bashrc bash_completion.d; do
   # Check to see if the file already has a symlink. If it does, we won't touch
   # it.
   if [ ! -h ~/.${file} ]; then
      # If the file exists, ask the user if they'd like us to move it to
      # FILENAME_old. If we don't move it, ln won't overwrite it, it'll just
      # fail.
      if [ -e ~/.${file} ]; then
         read -p "Move existing $file to ${file}_old? " -n 1
         if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "\n";
            mv ~/.${file} ~/.${file}_old
         fi
      fi
      # Add the appropriate symlink
      echo "Symlinking ~/dotfiles/${file} to ~/.${file}"
      ln -s ~/dotfiles/${file} ~/.${file}
   fi
done
