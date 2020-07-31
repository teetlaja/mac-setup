BACKUP_FILE=~/dotfiles/creds.7z
RESTORE_FOLDER=.creds

7z x -y "$BACKUP_FILE" -o"./$RESTORE_FOLDER"

if [ $? == 0 ]; then
    read -p "Backups temporarily available in ./$RESTORE_FOLDER. Take what you need, and press any key to delete ./$RESTORE_FOLDER..."
else
    echo "Something went wrong..."
fi

rm -rf "./$RESTORE_FOLDER"