#!/bin/bash

set -eu

function has() {
    type "$1" > /dev/null 2>&1
}

if has "brew"; then
  echo "xcode-select is already installed"
else
    # Install xcode
    xcode-select --install
fi

if has "brew"; then
  echo "Homebrew is already installed"
else
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update && brew upgrade
