=# Generate SSH key pair, if one doesn't exist yet
[ -f ~/.ssh/id_rsa.pub ] || ssh-keygen -f ~/.ssh/id_rsa -N ''

# Upload SSH key pair to GitHub
SSH_PUB_JSON=$(cat ~/.ssh/id_rsa.pub | jq -aR .)
echo "Git: SSH key copied to clipboard"
echo "Paste your key to GitHub https://github.com/settings/keys"
open  -a "Google Chrome" https://github.com/settings/keys