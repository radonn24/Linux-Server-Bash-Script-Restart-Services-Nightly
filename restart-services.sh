#!/usr/bin/bash

# Define the names of the services you want to manage
services=("memcached.service" "httpd.service" "mysql.service" "mysqld.service")

# Function to check the status of a service
check_service_status() {
    echo "$(date) - Checking the status of $1"
    if systemctl status "$1"; then
        echo "$(date) - $1 is running"
    else
        echo "$(date) - Failed to get the status of $1"
    fi
}

# Function to restart a service
restart_service() {
    echo "$(date) - Restarting $1"
    if systemctl restart "$1"; then
        echo "$(date) - $1 has been restarted"
    else
        echo "$(date) - Failed to restart $1"
    fi
}

# Log file
log_file="restart-services.log"

# Redirect output to the log file with timestamps
exec >> "$log_file"
exec 2>&1

# Check the status of services before restarting
for service in "${services[@]}"; do
    check_service_status "$service"
done

# Restart the services
for service in "${services[@]}"; do
    restart_service "$service"
done

# Check the status of services after restarting
for service in "${services[@]}"; do
    check_service_status "$service"
done
