#!/bin/zsh

# Restore extension list
if [ ! -f ~/dotfiles/vscode.extensions ]; then
    touch ~/dotfiles/vscode.extensions;
fi

echo "Installing VS Code extensions"
diff ~/dotfiles/vscode.extensions <(code --list-extensions | sort) | grep '<' | sed 's/< //' \
     | xargs -I extname code --install-extension extname