#!/bin/bash

# nmap_scan.sh - Run a basic Nmap scan

# Usage: ./nmap_scan.sh <target-ip>
target_ip=$1
if [ -z "$target_ip" ]; then
    echo "Please provide a target IP address."
    exit 1
fi

echo "Running Nmap scan on $target_ip"
nmap -sP "$target_ip"
