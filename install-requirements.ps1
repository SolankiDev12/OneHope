#!/bin/bash

# install-requirements.sh - Install necessary tools

echo "Installing required packages..."

# Install required tools
sudo apt update
sudo apt install -y nmap traceroute goaccess logwatch
