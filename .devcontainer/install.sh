TAG_NAME=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r ' .tag_name');
DOWNLOAD_URL="https://raw.githubusercontent.com/nvm-sh/nvm/$TAG_NAME/install.sh"

NVM_DIR=$HOME/.nvm
NODE_VERSION=15.14.0

curl $DOWNLOAD_URL | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
