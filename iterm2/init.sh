#!/bin/bash

set -eu

CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

ln -fs "$CURRENT_DIR/com.googlecode.iterm2.plist" ~/Library/Preferences
