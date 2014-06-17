
# Vimrc #

This is a vimrc repository

To enable the vim configuration, using the following command

## Fresh home ##

Apply following command for a fresh new installation of `.vim` files.

```shell
cd $HOME
git clone https://github.com/kirisetsz/vimrc.git .vim
cd .vim
```

## $HOME/.vim Exists ##

Use following command to synchronize an existing `.vim` configuration with
this repository.

```shell
cd $HOME/.vim
git init
git remote add origin https://github.com/kirisetsz/vimrc.git
git pull origin master
```

## Install Plugins ##

Then, type following code to fetch plugins managed in submodules.

```shell
git submodule update --init --recursive
```

## Older Vim Installation ##

For older vim, try to make a symbolic link to `~/.vim/vimrc`

```shell
ln -sf ~/.vim/vimrc ~/.vimrc
```

## YouCompleteMe ##

To enable YouCompleteMe after installation. Submodules of
`bundle/YouCompleteMe` should be initialized with

```shell
cd bundle/YouCompleteMe
sh install.sh --clang-completer --system-libclang # Or any other options
```

With the `.ycm_extra_conf.py` in this repository, it will automatically
search for `compile_commands.json` recursively from current `pwd`.

