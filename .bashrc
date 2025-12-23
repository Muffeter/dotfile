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
