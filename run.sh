## Install packages
## https://bit.ly/3l3AE2a

apt -y update

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

apt -y update  

apt -y install \
       git \
       nodejs \
       npm \
       apt-transport-https \
       ca-certificates \
       curl \
       gnupg-agent \
       software-properties-common

## install docker
curl https://releases.rancher.com/install-docker/19.03.sh | sh
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# add-apt-repository \
#     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#     $(lsb_release -cs) \
#     stable"
# apt -y update
# apt -y install \
#     docker-ce \
#     docker-ce-cli \
#     containerd.io

## yarn
curl -sL https://deb.nodesource.com/setup_current.x | -E bash -
apt install -y nodejs

## docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

## add ubuntu to docker group
usermod -a -G ubuntu docker
