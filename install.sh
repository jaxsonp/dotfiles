#!/usr/bin/env sh

cd $HOME
# cloning repository
git clone https://github.com/jaxsonp/dotfiles.git
mv dotfiles/ .dotfiles/

# perms
chmod -R 700 ./.dotfiles

# adding cron job 
(crontab -l; echo "* 0 * * * $HOME/.dotfiles/bin/sync-dotfiles") | awk '!x[$0]++' | crontab -

# performing manual sync
bash ./.dotfiles/bin/sync-dotfiles
echo "done"
