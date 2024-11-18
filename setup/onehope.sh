#!/bin/bash

# onehope.sh - The main wrapper script for OneHope toolkit

function show_help() {
    echo "Usage: onehope <command> [options]"
    echo
    echo "Commands:"
    echo "  help <tool>          Get help for a specific tool"
    echo "  scripts <category>   Generate scripts for a specific category (e.g., process, network)"
    echo
    echo "Available Tools:"
    echo "  nmap                  Run Nmap scanning tools"
    echo "  log                   Get log analysis tools"
    echo "  process               Generate process-related scripts"
    echo "  memory                Generate memory analysis scripts"
    echo "  disk                  Generate disk analysis scripts"
}

function get_help() {
    tool=$1
    case $tool in
        "nmap")
            echo "Nmap Command Help:"
            echo "  nmap -sP <target-ip>    Ping sweep"
            echo "  nmap -sV <target-ip>    Service version detection"
            ;;
        "log")
            echo "Log Analysis Tools:"
            echo "  logwatch --detail high --service all --range today"
            echo "  goaccess /var/log/apache2/access.log -o report.html"
            ;;
        "process")
            echo "Process-related Scripts:"
            echo "  ps aux                 List all running processes"
            echo "  top                    Interactive process viewer"
            ;;
        "memory")
            echo "Memory-related Scripts:"
            echo "  free -h                Display memory usage"
            echo "  vmstat                 Virtual memory statistics"
            ;;
        "disk")
            echo "Disk-related Scripts:"
            echo "  df -h                  Show disk space usage"
            echo "  du -sh /path/to/dir    Disk usage of a specific directory"
            ;;
        *)
            echo "No help available for $tool"
            ;;
    esac
}

function generate_scripts() {
    category=$1
    case $category in
        "network")
            echo "Generating Network Scripts:"
            echo "  nmap_scan.sh           Nmap scan script"
            echo "  ping.sh                Ping script"
            echo "  traceroute.sh          Traceroute script"
            ;;
        "process")
            echo "Generating Process Scripts:"
            echo "  process_list.sh        Process list script"
            ;;
        "memory")
            echo "Generating Memory Scripts:"
            echo "  memory_analysis.sh     Memory analysis script"
            ;;
        "disk")
            echo "Generating Disk Scripts:"
            echo "  disk_usage.sh          Disk usage script"
            ;;
        *)
            echo "No scripts available for category $category"
            ;;
    esac
}

# Parse command line arguments
command=$1
subcommand=$2

case $command in
    "help")
        if [ -z "$subcommand" ]; then
            show_help
        else
            get_help $subcommand
        fi
        ;;
    "scripts")
        if [ -z "$subcommand" ]; then
            echo "Please specify a category for scripts (e.g., network, process)"
        else
            generate_scripts $subcommand
        fi
        ;;
    *)
        echo "Invalid command. Type 'onehope help' for usage."
        ;;
esac
