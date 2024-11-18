#!/bin/bash

# ping.sh - Ping a target IP

# Usage: ./ping.sh <target-ip>
target_ip=$1
if [ -z "$target_ip" ]; then
    echo "Please provide a target IP address."
    exit 1
fi

echo "Pinging $target_ip"
ping -c 4 "$target_ip"
