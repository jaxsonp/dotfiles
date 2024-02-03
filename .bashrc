# .bashrc

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
PS1=' [\e[0;36m\u\e[0m: \e[0;37m\W\e[0m] > '

# ALIASES -------------------------------------------
# for sshing into data
alias data="ssh jpahuku@data.cs.purdue.edu"

# for opening stuff from the cmd line
alias open="xdg-open"

# ls shortcuts
alias ls="ls -h"
alias la="ls -a"
alias ll="ls -l"

# HISTORY STUFF -------------------------------------
# writes every bash command to ~/.bash_eternal_history
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER "$(history 1)" >> ~/.bash_eternal_history'

# PATH STUFF ----------------------------------------
# adding ./ to path
export PATH="./:$PATH"

# adding ~/.bin to path
export PATH="$HOME/.bin/:$PATH"

# DEV ENV STUFF  -------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env" # rust stuff probably
