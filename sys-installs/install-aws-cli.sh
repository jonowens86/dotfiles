#!/bin/bash

# Exit immediately if a command fails
set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "This script requires sudo or root privileges."
    exit 1
fi

# Check if apt exists
if ! command -v apt >/dev/null 2>&1; then
    echo "This script requires the apt package manager."
    exit 1
fi

echo "This script will install AWS CLI for Ubuntu Linux."
read -p "Do you want to continue? (y/n): " answer

if [ "$answer" != "y" ]; then
    echo "Installation cancelled."
    exit 0
fi
# Check if aws command already exists
if command -v aws >/dev/null 2>&1; then
    echo "A name conflict occurred: 'aws' already exists on this system."
    exit 1
fi

# Install required dependencies silently
apt update -y >/dev/null 2>&1
apt install -y curl unzip >/dev/null 2>&1

# Download AWS CLI installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" >/dev/null 2>&1

# Unzip installer
unzip -q /tmp/awscliv2.zip -d /tmp

# Run installer
/tmp/aws/install >/dev/null 2>&1

echo "Install complete."
echo "Try this command: aws --version"
