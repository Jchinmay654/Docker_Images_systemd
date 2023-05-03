##Script for [Debian/Ubuntu]##
#!bin/bash
 sudo apt update
 sudo apt install -y python3-pip libssl-dev
 python3 -m pip install molecule ansible-core
 python3 -m pip install --upgrade --user setuptools
 python3 -m pip install --user molecule
 python3 -m pip install --user molecule ansible-lint
 sudo apt-get update
 sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 sudo apt-get update
 sudo apt-get -y install docker-ce docker-ce-cli containerd.io 
 systemctl enable --now docker 
 python3 -m pip install --user "molecule-plugins[docker]"
 ansible-galaxy collection install community.docker
 ansible-galaxy collection install ansible.posix
 sudo dnf install -y libffi-devel git


