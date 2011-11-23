#!/bin/bash

# Sync all files to home dir '~'
cp ssh/config ~/.ssh/
echo "Copying ssh config."
cp vim/vimrc ~/.vimrc
echo "Copying vimrc"
cp bash/bashrc ~/.bashrc
echo "Copying bashrc"
if [ ! -d ~/.xmonad ]
then
    mkdir ~/.xmonad
    echo "Making .xmonad"
fi
cp xmonad/xmobar ~/.xmonad/xmobar
echo "Copying xmobar"
cp xmonad/xmonad.hs ~/.xmonad/xmonad.hs
echo "Copying xmonad.hs"
