#!/bin/bash

set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -e ~/Library/Application\ Support/Code/User ]; then
  ln -fsvn "${SCRIPT_DIR}/settings.json" ~/Library/Application\ Support/Code/User
fi

# Install extensions using the code command
if [ "$(which code)" != "" ]; then
  cat < "${SCRIPT_DIR}/extensions" | while read -r line
  do
    code --install-extension "$line"
  done
else
  echo "Install the code command from the command palette to add your extensions."
fi
