
git config --global user.email "sonmu.def@gmail.com"
git config --global user.name "sonmu"
git config --global github.user "Muffeter"
mv ~/.bashrc{,.bak}
cp ./.bashrc ~/.bashrc
cp ./.tmux.conf ~/.tmux.conf
source ~/.bashrc
apt install -y git tmux vim python3.13 python3.13-venv python3-pip

# tmux
tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true

# ansible
python3 -m venv ~/ansible/env
~/ansible/env/bin/python3 -m pip install ansible
mkdir -p ~/ansible
gitmy ansible_playbook ~/ansible/ansible_playbook
