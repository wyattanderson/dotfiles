#!/bin/bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/gvimrc ~/.gvimrc
ln -s ~/dotfiles/vim ~/.vim

if [ -e ~/.bash_profile ] && [ ! -h ~/.bash_profile ]; then
   read -p "Move existing .bash_profile to .bash_profile_old? " -n 1
   if [[ $REPLY =~ ^[Yy]$ ]]; then
      mv ~/.bash_profile ~/.bash_profile_old
      ln -s ~/dotfiles/bash_profile ~/.bash_profile
   fi
fi

if [ -e ~/.bashrc ] && [ ! -h ~/.bashrc ]; then
   read -p "Move existing .bashrc to .bashrc_old? " -n 1
   if [[ $REPLY =~ ^[Yy]$ ]]; then
      mv ~/.bashrc ~/.bashrc_old
      ln -s ~/dotfiles/bashrc ~/.bashrc
   fi
fi
