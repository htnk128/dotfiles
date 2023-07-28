# Do everything.
all: init link defaults brew

# Set initial preference.
init:
	bash .bin/init.sh

# Link dotfiles.
link:
	bash .bin/link.sh

# Set macOS system preferences.
defaults:
	bash .bin/defaults.sh

# Install macOS applications.
brew:
	bash .bin/brew.sh
