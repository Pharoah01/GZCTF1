#!/bin/bash

source ./aws/docker_install.sh
source ./aws/k3s_install.sh
source ./aws/helpers/check_root.sh
source ./aws/helpers/greater.sh


check_root
greeting_echo
apt_install_docker
check_version_kubernetes_install



