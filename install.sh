#!/bin/bash

source ./install_scripts/aws/docker_install.sh
source ./install_scripts/aws/k3s_install.sh
source ./install_scripts/aws/helpers/check_root.sh
source ./install_scripts/aws/helpers/greater.sh


check_root
greeting_echo
apt_install_docker
check_version_kubernetes_install



