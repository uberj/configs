#!/bin/bash

# Sync all files to home dir '~'
cp ssh/config ~/.ssh/
echo "Copying ssh config."
cp vim/vimrc ~/.vimrc
cp -fr vim/* ~/.vim/
echo "Copying .vimrc and .vim/"
cp bash/bashrc ~/.bashrc
echo "Copying bashrc"
cp zsh/zshrc ~/.zschrc
echo "Copying zshrc"
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

if [ ! -d ~/.config/qtile/ ]
then
    mkdir -p ~/.config/qtile/
    echo "Making .config/qtile"
fi

echo "Copying qtile"
cp qtile/config.py ~/.config/qtile/config.py
