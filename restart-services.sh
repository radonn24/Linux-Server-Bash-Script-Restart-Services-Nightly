#!/usr/bin/bash

# Log file
LOG_FILE="restart-services.log"

# Load the list of the names of the services you want to manage
services=($(cat restart-services.conf))

# Check the current CPU 5-minute load average
cpu_load_average=$(uptime | awk '{gsub(",", "", $10); print $10}')

# Check if the CPU load average is greater than 2.00
if (( $(echo "$cpu_load_average > 2.00" | bc -l) )); then
    echo "CPU load average exceeds 2.00. Continuing..."
else
    # Print the current load average
    echo "Load average: $cpu_load_average"
    echo "CPU load average is within the limit."
    
    # Ask the user if they want to continue
    read -p "Do you want to run the script anyways? (y/n): " choice
    if [[ $choice == "y" ]]; then
        echo "Continuing..."
    else
        echo "Exiting..."
        exit 1
    fi
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
exec >> "$LOG_FILE"
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
