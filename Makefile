# Do everything.
all: init link defaults brew

# Set initial preference.
init:
	bash .bin/init.sh

# Set iterm2 preference.
init-iterm2:
	bash iterm2/init.sh

# Set vscode preference.
init-vscode:
	bash vscode/init.sh

# Link dotfiles.
link:
	bash .bin/link.sh

# Set macOS system preferences.
defaults:
	bash .bin/defaults.sh

# Install macOS applications.
brew:
	bash .bin/brew.sh
