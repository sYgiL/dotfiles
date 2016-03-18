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
brew install cask chisel jq hub mergepbx pngquant highlight libpng optipng powerline sqlite python openssl

# Install cask apps
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install \
  atom\
  1password\
  alfred\
  appcode\
  arduino\
  calibre\
  dash\
  disk-inventory-x\
  evernote\
  firefox\
  forklift\
  google-chrome\
  google-drive\
  gopro-studio\
  imagealpha\
  imageoptim\
  istumbler\
  java\
  macdown\
  mplayerx\
  picasa\
  sourcetree\
  sequel-pro\
  sqlitebrowser\
  sqlprosqlite\
  steam\
  tunnelbear\
  tunnelblick\
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
  flux\
  rescuetime

#QuickLook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook provisionql
qlmanage -r

#Cleanup old versions

brew cleanup
brew cask cleanup

exit 0
