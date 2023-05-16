#!/bin/bash

# Define the log file
LOG_FILE="/var/log/syslog"

# Search for errors in the log file
ERRORS=$(grep "error" "$LOG_FILE")

# Filter out irrelevant data
ERRORS=$(echo "$ERRORS" | sed -e "s/.*error: //" -e "s/ at .*$//")

# Count the number of errors
ERROR_COUNT=$(echo "$ERRORS" | wc -l)

# Display the results
echo "Found $ERROR_COUNT errors:"
echo "$ERRORS" >errors.txt
