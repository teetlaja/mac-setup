#!/bin/zsh

# Backup Keychain Credentials
. backup/creds-backup.sh

# Backup VS Code Extensions
. backup/vscode-backup.sh

# Backup Dotfiles
. backup/dotfiles-migrate.sh