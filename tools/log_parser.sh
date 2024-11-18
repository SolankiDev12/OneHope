#!/bin/bash

# log_parser.sh - Parse logs

# Usage: ./log_parser.sh <log-file>
log_file=$1
if [ -z "$log_file" ]; then
    echo "Please provide a log file to parse."
    exit 1
fi

echo "Parsing log file $log_file"
grep -i "error" "$log_file"
