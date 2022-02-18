## install kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt -y update
sudo apt -y install kubectl

## set timezone (modify accordingly)
sudo timedatectl set-timezone Australia/Adelaide

## install azure cli (https://bit.ly/3H2KxYq)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## install k9s
echo -e "\ninstall k9s"
wget -qO- $(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep $(uname)_$(uname -m)) \
  | sudo tar xvzf - -C /usr/local/bin k9s \
  && sudo chown 0:0 /usr/local/bin/k9s

## install helm3
echo -e "\ninstall helm3"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
