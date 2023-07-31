#!/usr/bin/bash

# Log file
log_file="restart-services.log"

# Load the list of the names of the services you want to manage
services=($(cat restart-services.conf))

# Check the current CPU 5-minute load average
load_average=$(uptime | awk '{print $10}')

if (( $(echo "$load_average > 1.0" | bc -l) )); then
    logger "CPU load average exceeds 1.0"
    echo "CPU load average exceeds 1.0. Continuing..."
else
    logger "CPU load average is within the limit"
    echo "CPU load average is within the limit. Exiting..."
    exit 1
fi

# Function to check the status of a service
check_service_status() {
    echo "$(date) - Checking the status of $1"
    if systemctl status "$1"; then
        echo "$(date) - $1 is running"
    else
        echo "$(date) - Failed to get the status of $1"
        return 1
    fi
}

# Function to restart a service
restart_service() {
    echo "$(date) - Restarting $1"
    if systemctl restart "$1"; then
        echo "$(date) - $1 has been restarted"
    else
        echo "$(date) - Failed to restart $1"
        return 1
    fi
}

# Redirect output to the log file with timestamps
exec >> "$log_file"
exec 2>&1

# Check the status of services before restarting
for service in "${services[@]}"; do
    if ! check_service_status "$service"; then
        echo "$(date) - Error: Failed to check the status of $service" >&2
    fi
done

# Restart the services
for service in "${services[@]}"; do
    if ! restart_service "$service"; then
        echo "$(date) - Error: Failed to restart $service" >&2
    fi
done

# Check the status of services after restarting
for service in "${services[@]}"; do
    if ! check_service_status "$service"; then
        echo "$(date) - Error: Failed to check the status of $service" >&2
    fi
done
