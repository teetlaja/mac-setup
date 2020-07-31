
. utils/brew.sh

if [ ! -f .firstrundone ]; then
    . utils/git-firstrun.sh
    . utils/dock-firstrun.sh
    . utils/apps-firstrun.sh
    touch .firstrundone
fi

. utils/git-dotfiles.sh
. utils/dotfiles-migrate.sh

. utils/vscode-restore.sh
. utils/vscode-backup.sh

. utils/font-fira-code.sh