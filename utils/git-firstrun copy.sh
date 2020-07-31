source ./utils/get-ad-password.sh || source ./get-ad-password.sh

# Generate SSH key pair, if one doesn't exist yet
[ -f ~/.ssh/id_rsa.pub ] || ssh-keygen -f ~/.ssh/id_rsa -N ''

# Upload SSH key pair to git server, if doesn't exist
SSH_PUB_JSON=$(cat ~/.ssh/id_rsa.pub | jq -aR .)

curl -H 'Content-type: application/json' -X GET -u "$(whoami):$AD_PASSWORD" https://git.myjar.com/rest/ssh/1.0/keys | grep -qv "$SSH_PUB_JSON" \
&& (curl -H 'Content-type: application/json' -X POST -u "$(whoami):$AD_PASSWORD" https://git.myjar.com/rest/ssh/1.0/keys -d "{ \"text\": $SSH_PUB_JSON }" && echo "Git: Added new key") \
|| echo "Git: key already installed"
