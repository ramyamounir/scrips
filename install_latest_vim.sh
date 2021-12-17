
# make local directory for locally installed applications
mkdir -p ~/.local
mkdir ~/vim_temp

# install latest terminal utility (ncurses) from http://ftp.gnu.org/pub/gnu/ncurses/ or use 6.3 below
cd ~/vim_temp
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.3.tar.gz
tar -xzvf ncurses-6.3.tar.gz
cd ncurses-6.3
./configure --prefix=$HOME/.local
make
make install

# install the latest vim
cd ~/vim_temp
git clone https://github.com/vim/vim.git
cd vim/src
LDFLAGS=-L$HOME/.local/lib ./configure --prefix=$HOME/.local
make
make install

# add directory to path
echo "export PATH=$PATH:$HOME/.local/bin" >> ~/.bashrc

# Remove temp directory -- cleanup
cd
rm -rf ~/vim_temp
