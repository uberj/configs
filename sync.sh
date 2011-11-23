#!/bin/bash

# Sync all files.
cp ssh/config ~/.ssh/
cp vim/vimrc ~/.vimrc
cp bash/bashrc ~/.bashrc
if [ ! -d ~/.xmonad ]
then
    mkdir ~/.xmonad
fi
cp xmonad/xmobar ~/.xmonad/xmobar
cp xmonad/xmonad.hs ~/.xmonad/xmonad.hs
