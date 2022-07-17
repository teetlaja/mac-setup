#!/bin/zsh

# Reset:
# defaults delete com.apple.dock && killall Dock

# Debug current:
# defaults read com.apple.dock persistent-apps

# Or:
# cp ~/Library/Preferences/com.apple.dock.plist .
# plutil -convert xml1 com.apple.dock.plist 
# code com.apple.dock.plist

echo "Dock: Configuring"
defaults write com.apple.dock showhidden -bool TRUE
defaults write com.apple.dock autohide -bool FALSE
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock magnification -bool TRUE
defaults write com.apple.dock largesize -int 60
defaults write com.apple.dock show-recents -bool FALSE

# Show CPU bars in Dock when ActivityMonitor is running
defaults write com.apple.ActivityMonitor IconType -int 5

echo "Dock: Clearing default apps"
dockutil --no-restart --remove Siri
dockutil --no-restart --remove Safari
dockutil --no-restart --remove Mail
dockutil --no-restart --remove Terminal
dockutil --no-restart --remove Contacts
dockutil --no-restart --remove Reminders
dockutil --no-restart --remove Maps
dockutil --no-restart --remove Photos
dockutil --no-restart --remove Messages
dockutil --no-restart --remove TV
dockutil --no-restart --remove Numbers
dockutil --no-restart --remove FaceTime
dockutil --no-restart --remove Pages
dockutil --no-restart --remove Keynote
dockutil --no-restart --remove iTunes
dockutil --no-restart --remove iMovie
dockutil --no-restart --remove iBooks
dockutil --no-restart --remove "App Store"

echo "Dock: Adding useful apps"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Tandem.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/System/Applications/Calculator.app"
dockutil --no-restart --add "/Applications/Keeper Password Manager.app"

killall Dock