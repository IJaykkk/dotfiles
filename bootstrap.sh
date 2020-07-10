#!/usr/bin/env bash

function copyFiles() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;

  cd ~
  rm -rf .vim
  git clone https://github.com/IJaykkk/vim-setting.git ~/.vim
  vim +PlugClean +PlugInstall +qall
}

function brewInstall() {
  #install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew install vim && brew install macvim
  brew install git
  brew install npm
  brew install zsh
  brew install ctags
  brew install ack
  brew install pyenv
  brew install pyenv-virtualenv
  sudo easy_install pip

  # install cask, which extends homebrew
  brew tap homebrew/cask-cask

  # install sourcetree
  brew cask install sourcetree

  # install java and maven
  brew cask install java
  brew install maven

  # install autojump
  brew install autojump
}

function npmInstall() {
  # install prompt pure
  npm install --global pure-prompt
  # vim markdown dependency
  npm install -g livedown
}

function beautify() {
  # ZSH
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  # install autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  # change default shell to zsh
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
}

function misc() {
  # setuptools and wheel
  pip3 install setuptools wheel twine
}

brewInstall;
copyFiles;
npmInstall;
beautify;
misc;

source ~/.zshrc

unset brewInstall;
unset copyFiles;
unset npmInstall;
unset beautify;
unset misc;
