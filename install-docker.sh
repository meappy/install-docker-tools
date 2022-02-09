## installs docker ce, docker compose
## for development only

## usage:
## curl https://raw.githubusercontent.com/meappy/install-docker-tools/master/install-docker.sh | sh

## ref: https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

## update
sudo apt -y update

## set timezone (modify accordingly)
sudo timedatectl set-timezone Australia/Adelaide 

## git
sudo apt -y install \
            git \
            apt-transport-https \
            ca-certificates \
            curl \
            gnupg-agent \
            software-properties-common

## install docker
curl https://releases.rancher.com/install-docker/$(echo $(get_latest_release "docker/docker-ce") | cut -c2-).sh | sudo sh

## docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(get_latest_release "docker/compose")/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

## add ubuntu to docker group
sudo usermod -a -G docker ubuntu