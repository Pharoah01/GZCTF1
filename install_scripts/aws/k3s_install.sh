#!/bin/bash


check_version_kubernetes_install(){
		printf "Checking if kubernetes exist....\n"

		if ! command -v k3s &> /dev/null; then

				# isntall kubernetes
				curl -sfL https://get.k3s.io | sh -
				# For the install to be successfull....recommened by the k3s site
				sleep 40
		else
				printf "\n K3S is installed already"

		fi
}


