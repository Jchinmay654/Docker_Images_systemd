##Script for [RHEL/CentOS/Amazon-linux]##
#!bin/bash
 sudo dnf install -y gcc python3-pip python3-devel openssl-devel python3-libselinux
 python3 -m pip install molecule ansible-core
 python3 -m pip install --upgrade --user setuptools
 python3 -m pip install --user molecule
 python3 -m pip install --user molecule ansible-lint
 yum install docker -y 
 systemctl enable --now docker
 python3 -m pip install --user "molecule-plugins[docker]"
 ansible-galaxy collection install community.docker
 ansible-galaxy collection install ansible.posix
 sudo dnf install -y libffi-devel git
