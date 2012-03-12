#!/bin/bash

# Sync all files to home dir '~'
echo "Copying ssh config."
cp ssh/config ~/.ssh/
echo "Fixing perms."
chmod 600 ~/.ssh/config
cp vim/vimrc ~/.vimrc
echo "Copying vimrc"
cp bash/bashrc ~/.bashrc
echo "Copying gitconfig"
cp git/gitconfig ~/.gitconfig
echo "Copying bashrc"
if [ ! -d ~/.xmonad ]
then
    mkdir ~/.xmonad
    echo "Making .xmonad"
fi
echo "Copying xmobar"
cp xmonad/xmobar ~/.xmonad/xmobar
echo "Copying xmonad.hs"
cp xmonad/xmonad.hs ~/.xmonad/xmonad.hs

echo "Copying util scripts"
for file in $(ls utils/)
do
    cp utils/$file ~/.$file
done
