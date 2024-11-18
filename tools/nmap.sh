#!/bin/bash

# nmap.sh - Run nmap scan

# Usage: ./nmap.sh <target-ip>
target_ip=$1
if [ -z "$target_ip" ]; then
    echo "Please provide a target IP address."
    exit 1
fi

echo "Running Nmap scan on $target_ip"
nmap -sV "$target_ip"
