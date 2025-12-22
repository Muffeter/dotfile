# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
alias proxy="export HTTP_PROXY=http://127.0.0.1:7897 && export HTTPS_PROXY=http://127.0.0.1:7897"
alias unproxy="export HTTP_PROXY= && export HTTPS_PROXY="
alias clash="sudo systemd start clash"
alias unclash="sudo systemd stop clash"
alias gc="git add . && git commit"
alias so="source"
