#!/bin/bash -ex

if [[ "$OSTYPE" == Darwin* ]]; then
    echo "Mac OS detected..."
    if [[ ! $(command -v brew) ]]; then
        echo "Installing Brew..."
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | ruby
    fi
    brew install git yadm
elif [[ "$OSTYPE" == Linux* ]]; then
    echo "Linux detected..."
    sudo apt-get update
    sudo apt-get install -y git yadm
fi

yadm clone https://github.com/zubieta/dotfiles.git
yadm status
yadm alt
yadm bootstrap
