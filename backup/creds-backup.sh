# 7zip up all sensitive configuration files

BACKUP_FOLDER=~/dotfiles
BACKUP_FILE="$BACKUP_FOLDER/creds.7z"

if [ ! -d "$BACKUP_FOLDER" ]; then
    echo "Folder $BACKUP_FOLDER doesn't exist.";
    exit 1;
fi

if [ -f "$BACKUP_FILE" ]; then
    echo "Updating archive $BACKUP_FILE"
else
    echo "Creating an encrypted 7zip file - set a strong password!"
fi

7z a -p -mhe=on "$BACKUP_FILE" ~/Library/Keychains/login.keychain-db ~/.ssh \
 && echo "Backed up to $BACKUP_FILE, please review and commit to Git" \
 || echo "!!! Backup failed!"
