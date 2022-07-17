# Poweruser terminal https://ohmyz.sh/#install
if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing Oh My Zsh"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "Oh My Zsh already installed"
fi