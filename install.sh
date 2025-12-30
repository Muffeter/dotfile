
git config --global user.email "sonmu.def@gmail.com"
git config --global user.name "sonmu"
mv ~/.bashrc{,.bak}
cp ./.bashrc ~/.bashrc
cp ./.tmux.conf ~/.tmux.conf
source ~/.bashrc
apt install git tmux vim
tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true

