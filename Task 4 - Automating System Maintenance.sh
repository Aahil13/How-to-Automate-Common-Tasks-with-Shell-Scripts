#!/bin/bash

# Get user confirmation before proceeding
read -p "This script will perform system maintenance tasks. Are you sure you want to proceed? (y/n) " confirm

if [[ $confirm != [yY] ]]; then
    echo "Aborting script."
    exit 1
fi

# Define variables
log_file="/var/log/system_maintenance.log"

# Create log file if it doesn't exist
touch $log_file

# Check system disk space usage and append the result to the log file
df -h >>$log_file

# Remove old log files
find /var/log/ -type f -name "*.log" -mtime +30 -delete >>$log_file

service apache2 restart >>$log_file

# Send email to sysadmin with the log file attached
mailx -a $log_file -s "System maintenance report" sysadmin@example.com
