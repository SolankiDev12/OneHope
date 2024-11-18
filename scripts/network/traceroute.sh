#!/bin/bash

# traceroute.sh - Run traceroute to a target

# Usage: ./traceroute.sh <target-ip>
target_ip=$1
if [ -z "$target_ip" ]; then
    echo "Please provide a target IP address."
    exit 1
fi

echo "Running traceroute to $target_ip"
traceroute "$target_ip"
