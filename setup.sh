# Install brew and all applications
. restore/brew.sh

# On the first run
if [ ! -f .firstrundone ]; then
    # Clear the Dock
    . restore/firstrun/dock-firstrun.sh
    # Launch some apps
    . restore/firstrun/apps-firstrun.sh
    # Generate ssh key
    . restore/firstrun/git-firstrun.sh
    # Install global yarn packages
    . restore/firstrun/yarn.sh
    # Add powerline fonts
    . restore/firstrun/powerline-fonts.sh
    touch .firstrundone
fi

# Setup Dotfiles
. backup/dotfiles-migrate.sh