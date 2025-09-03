# .bashrc


# Enabling **
shopt -s globstar


# ENV STUFF ------------------------------------------
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# 
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$PATH"
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
PS1=' [\[\e[0;36m\]\u\[\e[0m\]@\h: \[\e[0;37m\]\W\[\e[0m\]] > '



# ALIASES -------------------------------------------

# ls shortcuts
alias ls="ls -h --color=auto"
alias la="ls -a"
alias ll="ls -al"

# python
alias python=python3



# DEV ENV STUFF  -------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d "$HOME/.cargo" ]; then
	. "$HOME/.cargo/env"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jpahukula/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jpahukula/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jpahukula/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jpahukula/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

