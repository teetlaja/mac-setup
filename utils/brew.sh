
if [ ! $(which brew) ]; then
    echo "Installing Homebrew package manager - https://brew.sh/"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
else
    echo "Upgrading brew dependencies"
    brew update
    brew upgrade
fi

echo "Installing applications"

INSTALLED=$(brew list)

function brew_if_not_installed () {
    package=$1
    if [[ ! $INSTALLED = *"$package"* ]]; then
        brew install $package
    fi
}

INSTALLED_CASK=$(brew cask list)

function brew_cask_if_not_installed () {
    package=$1
    if [[ ! $INSTALLED_CASK = *"$package"* ]]; then
        brew cask install $package
    fi
}


brew_if_not_installed git
brew_if_not_installed node
brew_if_not_installed yarn
brew_if_not_installed jq
brew_if_not_installed p7zip
brew_if_not_installed the_silver_searcher
brew_if_not_installed postgresql
brew_if_not_installed mongodb-community
brew_if_not_installed mongoose
brew_if_not_installed redis
brew_if_not_installed ruby-build
brew_if_not_installed speedtest
brew_if_not_installed spotify
brew_if_not_installed spotify-tui
brew_if_not_installed iterm2

brew_cask_if_not_installed visual-studio-code
brew_cask_if_not_installed google-chrome
brew_cask_if_not_installed firefox
brew_cask_if_not_installed slack
brew_cask_if_not_installed microsoft-office
brew_cask_if_not_installed postman
brew_cask_if_not_installed sequel-pro
brew_cask_if_not_installed mysqlworkbench
brew_cask_if_not_installed pgadmin4
