function migrate () {
    mkdir -p $(dirname "$2")

    if [[ -f "$1" && ! -L "$1" ]]; then
        if [ -f "$2" ]; then
            mv "$1" "$1".$(date +%s).backup;
        else
            mv "$1" "$2"
        fi
    fi

    if [ ! -f "$2" ]; then
        touch "$2"
    fi

    if [ ! -L "$1" ]; then
        ln -s "$2" "$1"
    fi
}

migrate_simple () {
    migrate ~/."$1" ~/dotfiles/"$1"
}

migrate_simple gitconfig
migrate_simple bashrc
migrate_simple bash_profile
migrate_simple anyconnect
migrate ~/.ssh/config ~/dotfiles/ssh-config
migrate ~/.ssh/known_hosts ~/dotfiles/ssh-known_hosts
migrate ~/"Library/Application Support/Code/User/settings.json" ~/dotfiles/vscode-settings.json