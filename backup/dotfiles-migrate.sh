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

migrate_simple zshrc
migrate_simple gitconfig
migrate ~/.ssh/config ~/dotfiles/ssh-config
migrate ~/.aws/credentials ~/dotfiles/aws-config
migrate ~/.ssh/known_hosts ~/dotfiles/ssh-known_hosts