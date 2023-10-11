#!/bin/bash

set -eu

# install programming language
which asdf >/dev/null 2>&1 && asdf plugin add nodejs && asdf install nodejs latest && asdf global nodejs latest && asdf local nodejs latest
which asdf >/dev/null 2>&1 && asdf plugin add python && asdf install python latest && asdf global python latest && asdf local python latest
which asdf >/dev/null 2>&1 && asdf plugin add golang && asdf install golang latest && asdf global golang latest && asdf local golang latest
which asdf >/dev/null 2>&1 && asdf plugin-add java https://github.com/halcyon/asdf-java.git && asdf install java latest:adoptopenjdk-17 && asdf global java latest:adoptopenjdk-17 && asdf local java latest:adoptopenjdk-17
