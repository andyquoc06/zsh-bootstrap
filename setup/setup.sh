#!/bin/bash
cd ~
env=$1

function doIt() {
  # install neobundle (vim plugin manager)
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

  # install antigen
  curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh

  # setup symlinks
  ln -sfv {~/dotfiles/,./}antigen.zsh
  ln -sfv {~/dotfiles/,./}.exports
  ln -sfv {~/dotfiles/,./}.functions
  ln -sfv {~/dotfiles/,./}.aliases
  ln -sfv {~/dotfiles/,./}.zshrc
  ln -sfv {~/dotfiles/,./}.vimrc
  ln -sfv {~/dotfiles/,./}.slate.js
  ln -sfv {~/dotfiles/,./}.osx
  ln -sfv {~/dotfiles/,./.vim/}
  ln -sfv {~/dotfiles/extra/${env}.sh,./.extra}

  # change shell to zsh
  chsh -s /bin/zsh

  # install utils
  brew install tree
  brew install wget
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
