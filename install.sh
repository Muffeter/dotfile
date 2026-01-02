
git config --global user.email "sonmu.def@gmail.com"
git config --global user.name "sonmu"
mv ~/.bashrc{,.bak}
cp ./.bashrc ~/.bashrc
cp ./.tmux.conf ~/.tmux.conf
source ~/.bashrc
apt install git tmux vim python3

# tmux
tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true

# ansible
python3 -m pip install ansible venv
mkdir ~/ansible
python3 -m venv ~/ansible/env
gitmy ansible_playbook ~/ansible/ansible_playbook
