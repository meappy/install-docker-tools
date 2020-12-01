## Install packages

## https://bit.ly/3l3AE2a
sudo apt -y update

## git
sudo apt -y install \
            git \
            npm \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg-agent \
            software-properties-common

## nodejs
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash - && \
sudo apt install -y nodejs

## yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt -y update
sudo apt -y install yarn

## install docker
curl https://releases.rancher.com/install-docker/19.03.sh | sudo sh

## docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

## add ubuntu to docker group
sudo usermod -a -G docker ubuntu

## install npm-run-all
npm install npm-run-all --save-dev
