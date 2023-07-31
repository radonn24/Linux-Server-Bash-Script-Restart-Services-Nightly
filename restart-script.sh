#!/usr/bin/bash

# Define the names of the services you want to manage
service1="memcached.service"
service2="httpd.service"
service3="mysql.service"
service4="mysqld.service"

# Function to check the status of a service
check_service_status() {
    echo "$(date) - Checking the status of $1"
    systemctl status "$1"
}

# Function to restart a service
restart_service() {
    echo "$(date) - Restarting $1"
    systemctl restart "$1"
}

# Log file
log_file="restart-services.log"

# Redirect output to the log file with timestamps
exec >> "$log_file"
exec 2>&1

# Check the status of services before restarting
check_service_status "$service1"
check_service_status "$service2"
check_service_status "$service3"
check_service_status "$service4"

# Restart the services
restart_service "$service1"
restart_service "$service2"
restart_service "$service3"
restart_service "$service4"

# Check the status of services after restarting
check_service_status "$service1"
check_service_status "$service2"
check_service_status "$service3"
check_service_status "$service4"
