#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  fi

fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install homebrew packages
brew install cask chisel jq hub mergepbx

# Install cask apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install \
  atom\
  1password\
  alfred\
  appcode\
  araxis-merge\
  arduino\
  bbedit\
  calibre\
  dash\
  disk-inventory-x\
  evernote\
  firefox\
  forklift\
  google-chrome\
  google-drive\
  gopro-studio\
  #hma-pro-vpn\
  imagealpha\
  imageoptim\
  istumbler\
  #keyremap4macbook\
  macdown\
  mplayerx
  #onedrive\
  picasa\
  rdm\
  sourcetree\
  #speed download\
  sequel-pro\
  sqlitebrowser\
  sqlprosqlite\
  steam\
  tunnelbear\
  tunnelblick\
  #twitter
  unrarx\
  virtualbox\
  utorrent\
  vlc\
  viber\
  slack\
  skype\
  iterm2\
  dropbox\
  google-photos-backup\
  charles\
  telegram\
  flux\
  rescuetime

#QuickLook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook provisionql
qlmanage -r

#Cleanup old versions

brew cleanup
brew cask cleanup

exit 0
