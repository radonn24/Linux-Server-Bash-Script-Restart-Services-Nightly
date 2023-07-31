# Service Management Script

This script is a bash script that manages the status and restart of multiple services. It provides functions to check the status of a service and restart a service.

## Prerequisites

Make sure you have the following prerequisites installed on your system:
- Bash shell
- Systemctl (for managing services)

## Usage

1. Clone the repository to your local machine.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable by running the following command: 
`chmod +x restart-services.sh`
4. Run the script by executing the following command: `./restart-services.sh`

## Customization

You can customize the script by modifying the following variables:
- `service1`, `service2`, `service3`, `service4`: Change the names of the services you want to manage.
- `log_file`: Change the name or path of the log file.

## Output

The script redirects the output to a log file named `restart-services.log` in the same directory. The log file contains the timestamps and the status of the services before and after restarting.

## License

This script is licensed under the [MIT License](LICENSE).

Feel free to modify and use this script to suit your needs.
