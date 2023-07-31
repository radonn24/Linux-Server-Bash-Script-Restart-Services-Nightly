# Linux Server Bash Script: Restart Services Nightly

This script is a bash script that manages the restart of multiple services. It reads the names of the services from a configuration file, checks the status of each service, restarts them if needed, and then checks their status again. The output of the script is redirected to a log file with timestamps. Any errors that occur during the process are also logged.

## Prerequisites

- Bash shell
- Systemctl (a Linux command for controlling systemd services)

## Usage

1. Make sure you have the necessary permissions to run the script.
2. Create a `services.conf` file in the same directory as the script.
3. Populate the `services.conf` file with the names of the services you want to manage, each on a separate line.
4. Make the script executable by running the following command: `chmod +x restart-services.sh`
5. Run the script using the following command: `./restart_services.sh`
6. The script will check the status of each service, restart them if needed, and log the results to `restart-services.log`.

## Using crontab to run this script automatically at midnight EST time zone every day

1. Open your current crontab file by running `crontab -e`
2. Paste this at the bottom of the file: `* 0 * * * /restart_services.sh >/dev/null 2>&1`
   Or, use this to create your own time settings: https://crontab-generator.org/

## Logging

The script redirects its output to a log file named `restart-services.log` in the same directory. The log file contains timestamps and records the status of each service check and restart.

## Error Handling

If any errors occur during the status check or restart process, error messages will be logged to `restart-services.log`.

Feel free to modify the script or the configuration file as needed for your specific use case.

## License

This script is licensed under the [MIT License](LICENSE).

## Contributing

Contributions are welcome! If you find any issues or want to suggest improvements, please create an issue or submit a pull request.
