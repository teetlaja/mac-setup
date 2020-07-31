# Pretty coding font https://github.com/tonsky/FiraCode/wiki
brew tap caskroom/fonts

INSTALLED_CASK=$(brew cask list)

function brew_cask_if_not_installed () {
    package=$1
    if [[ ! $INSTALLED_CASK = *"$package"* ]]; then
        brew cask install $package
    fi
}

brew_cask_if_not_installed font-fira-code
git clone https://github.com/powerline/fonts.git --depth=1 && fonts/install.sh && rm -rf fonts