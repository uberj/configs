#!/bin/bash

# Grab all the files in the homedir and update the files in the repo.
echo "Updating the repo."
cp ~/.ssh/config ssh/config
echo "Copying ssh config."
cp ~/.vimrc vim/vimrc
echo "Copying vimrc"
cp ~/.bashrc bash/bashrc
echo "Copying gitconfig"
cp ~/.gitconfig git/gitconfig
echo "Copying bashrc"
if [ ! -d ~/.xmonad ]
then
    mkdir ~/.xmonad
    echo "Making .xmonad"
fi
echo "Copying xmobar"
cp ~/.xmonad/xmobar xmonad/xmobar
echo "Copying xmonad.hs"
cp ~/.xmonad/xmonad.hs xmonad/xmonad.hs
echo "Copying util scripts"
for file in $(ls utils/)
do
    cp ~/.$file utils/$file
done
