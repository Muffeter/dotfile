#!/bin/bash
set -x

Clash_Port=7890

alias syss="sudo systemctl status"
alias syst="sudo systemctl start"
alias sysp="sudo systemctl stop"
alias proxy="export HTTP_PROXY=http://127.0.0.1:$Clash_Port && export HTTPS_PROXY=http://127.0.0.1:$Clash_Port"
alias unproxy="export HTTP_PROXY= && export HTTPS_PROXY="
alias _clash="syst clash"
alias unclash="sysp clash"
alias gc="git add . && git commit"
alias gcm="git add . && git commit -m"
alias gp="git pull && git push"

# -- helper
exist() {
	command -v "$1" > /dev/null
}

gitmy() {
	if [ -z $2 ];then
		# without second arg
		git clone "https://github.com/Muffeter/$1"
	else
		git clone "https://github.com/Muffeter/$1" $2
	fi
}

_install_nvim() {
	if exist nvim; then
		echo "nvim installed."
		return
	else
		export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
	fi
	if ![ -a /opt/nvim-linux-x86_64/bin/nvim ]; then
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
	sudo rm -rf /opt/nvim-linux-x86_64
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
	fi
}

test1() {
	if [ -z $1 ];then
		echo "no arg"
	else
		echo "yes arg"
	fi

}

# --- env
if exist nvim; then
	export EDITOR=nvim
	alias vim=nvim
elif exist vim; then
	export EDITOR=vim
else
	export EDITOR=vi
	alias vim=vi
fi
set +x

# --- input

# Disable alert
set bell-style none

# Make Tab autocomplete regardless of filename case
set completion-ignore-case on

# List all matches in case multiple possible completions are possible
set show-all-if-ambiguous on

# Immediately add a trailing slash when autocompleting symlinks to directories
set mark-symlinked-directories on

# Show all autocomplete results at once
set page-completions off

# If there are more than 200 possible completions for a word, ask to show them all
set completion-query-items 200

# Show extra file information when completing, like `ls -F` does
set visible-stats on

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
set skip-completed-text on

# Allow UTF-8 input and output, instead of showing stuff like $'\0123\0456'
set input-meta on
set output-meta on
set convert-meta off
