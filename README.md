# Service Management Script

This is a Bash script that manages the status and restarts multiple services. It allows you to define a list of services and performs the following actions for each service:

- Checks the status of the service
- Restarts the service if needed
- Logs the status and restart actions to a file with timestamps

## Prerequisites

To use this script, you need to have the following:

- Bash shell environment
- Appropriate permissions to manage the services using `systemctl`

## Usage

1. Clone or download the script to your local machine.
2. Open the terminal and navigate to the directory where the script is located.
3. Make the script executable by running the following command: `chmod +x restart-services.sh`
4. Modify the `services` array in the script to include the names of the services you want to manage.
5. Run the script using the following command: `./restart-services.sh`

## Logs

The script logs the status and restart actions for each service to a file named `restart-services.log`.

## License

This script is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! If you find any issues or want to suggest improvements, please create an issue or submit a pull request.
