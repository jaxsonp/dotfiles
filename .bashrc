# .bashrc

# Enabling **
shopt -s globstar

# ENV STUFF ------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

# making it pretty :D
PS1=' [\e[0;36m\u\e[0m:@\h \e[0;37m\W\e[0m] > '

# ALIASES -------------------------------------------

# ls shortcuts
alias ls="ls -h --color=auto"
alias la="ls -a"
alias ll="ls -al"

# python
alias python=python3

# PATH STUFF ----------------------------------------

# add ./ to path
PATH="./:$PATH"
PATH="$PATH:/usr/local/zig-linux-x86_64-0.13.0/"

# HISTORY STUFF -------------------------------------
# writes every bash command to ~/.bash_eternal_history
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_iCOMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> ~/.bash_eternal_history'

# DEV ENV STUFF  -------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

