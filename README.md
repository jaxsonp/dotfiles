# dotfiles

My lovely little dotfiles repository

## Dependencies

* [tpm](https://github.com/tmux-plugins/tpm) (`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux package manager`)
* [ripgrep](https://github.com/BurntSushi/ripgrep) (package manager `ripgrep`?)
* [fzf](https://github.com/junegunn/fzf) (package manager `fzf`?)
* virtualenv/python3-venv
* For rust dev: cargo, rust-analyzer, rustfmt (rustup)

## Installation

```sh
curl https://raw.githubusercontent.com/jaxsonp/dotfiles/main/install.sh | sh
```

This command clones this repository into the home directory and adds a cron job

## To manually sync

Dotfiles should autosync after install, but to trigger a manual sync run the following command:

```sh
sync-dotfiles
```
