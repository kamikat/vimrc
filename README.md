.vimrc
------

This is a vimrc repository

To enable the vim configuration, using the following command

### Fresh new $HOME ###

Apply following command for a fresh new installation of `.vim` files.

    cd $HOME
    git clone https://github.com/kamikat/vimrc.git .vim
    cd .vim

### $HOME/.vim Exists ###

Use following command to synchronize an existing `.vim` configuration with
this repository.

    cd $HOME/.vim
    git init
    git remote add origin https://github.com/kamikat/vimrc.git
    git pull origin master

### Init Plugins ###

Then, type following code to fetch plugins managed in submodules.

    git submodule update --init --recursive

### Older Vim Installation ###

For older vim, try to make a symbolic link to `~/.vim/vimrc`

    ln -sf ~/.vim/vimrc ~/.vimrc

