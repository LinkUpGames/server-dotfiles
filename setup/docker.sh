#!/bin/bash

# download the install
dnf remove docker \
  docker-client \
  docker-client-latest \
  docker-common \
  docker-latest \
  docker-latest-logrotate \
  docker-logrotate \
  docker-selinux \
  docker-engine-selinux \
  docker-engine

dnf -y install dnf-plugins-core
dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

groupadd docker

usermod -aG docker $USER

echo "User added to docker group! You may need to exit to see these changes"

# Enable services on boot
systemctl enable docker.service
systemctl enable containerd.service
