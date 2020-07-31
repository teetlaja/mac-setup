# Restore extension list
if [ ! -f ~/dotfiles/vscode.extensions ]; then
    touch ~/dotfiles/vscode.extensions;
fi

diff ~/dotfiles/vscode.extensions <(code --list-extensions | sort) | grep '<' | sed 's/< //' \
     | xargs -I extname code --install-extension extname