#!/usr/bin/env bash

cd $HOME
git clone https://github.com/jaxsonp/dotfiles.git
bash ./.dotfiles/.bin/sync-dotfiles
echo "done"
