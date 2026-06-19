#!/bin/bash

# Check if wget exist

apt_install_docker() {
		printf "Checking for all the pre-requisits...with apt package manager"

		# Update and upgrage
		apt update -y && apt upgrade -y

		# Define the list with spaces between elements
		apps=("wget" "git" "docker.io" "docker-compose")

		# Iterate through the array
		for app in "${apps[@]}"; do
			if command -v "$app" &> /dev/null; then
				echo "$app already installed"
			else
				echo "Installing $app..."
				# Added -y to automatically confirm installation
				sudo apt update && sudo apt install -y "$app"
			fi
		done

}


