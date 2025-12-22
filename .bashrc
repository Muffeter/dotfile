#!/bin/bash
set -x
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
alias syss="sudo systemctl status"
alias syst="sudo systemctl start"
alias sysp="sudo systemctl stop"
alias proxy="export HTTP_PROXY=http://127.0.0.1:7897 && export HTTPS_PROXY=http://127.0.0.1:7897"
alias unproxy="export HTTP_PROXY= && export HTTPS_PROXY="
alias clash="syss clash"
alias unclash="sysp clash"
alias gc="git add . && git commit"
alias gcm="git add . && git commit -m"
alias so="source"


# -- helper
exist() {
	command -v "$1" > /dev/null
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
