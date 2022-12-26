#!/bin/bash

# =====================================================
# Basic configurations
# =====================================================

# Set variable DEVICE_NAME to the name of the device you want to use
DEVICE_NAME="ACTON II"

# Set variable CHECK_INTERVAL to the number of minutes between checks
# Value must be between 1 and 59
CHECK_INTERVAL=1

# Set variable PATH_TO_SCRIPT to the path to the connect_bluetooth.bash script
# If you're not sure what this is, leave it as is
PATH_TO_SCRIPT="$(pwd)/connect_bluetooth.bash"





# =====================================================
# Don't edit below this line unless you know what you're doing
# =====================================================

# Exit if any command fails
set -e

# Check if blueutil is installed
if ! command -v blueutil &> /dev/null; then
  echo "blueutil is not installed"
    echo "Install blueutil with: brew install blueutil"
  exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
  echo "jq is not installed"
  echo "Install jq with: brew install jq"
  exit 1
fi

# Make sure the script is executable
chmod +x "$PATH_TO_SCRIPT"

# Add the script to the crontab
# PATH is set to the current path so that the script can find blueutil and jq
( crontab -l 2>/dev/null; echo -e "PATH=$PATH \n*/$CHECK_INTERVAL * * * * $PATH_TO_SCRIPT '$DEVICE_NAME' >/tmp/stdout.log 2>/tmp/stderr.log") | crontab - || {
  # Print an error message if the command fails
  echo "An error occurred while setting up the cron job." >&2
  exit 1
}

echo "$(tput setaf 2)Bluetooth connection script has been set up successfully.$(tput sgr0)"
echo "$(tput setaf 2)Your mac will now try to connect to $(tput sgr0)$(tput setab 6)$DEVICE_NAME$(tput sgr0)$(tput setaf 2) every $(tput sgr0)$(tput setab 6)$CHECK_INTERVAL$(tput sgr0)$(tput setaf 2) minutes.$(tput sgr0)"
echo -e "\n"
echo "$(tput setaf 4)If you want to change the device name or the check interval, edit this file and run it again.$(tput sgr0)" 
echo "$(tput setaf 4)INFO: If you want to remove the script from the crontab, run the following command:$(tput sgr0)" 
echo "$(tput setab 2)crontab -e$(tput sgr0)$(tput setaf 4) and remove the corresponding lines from the file. You can also run $(tput sgr0)$(tput setab 2)crontab -r$(tput sgr0)$(tput setaf 4) to remove all cron jobs.$(tput sgr0)"
echo -e "\n"
echo "$(tput setaf 4)If you want to check the logs, run the following command:$(tput sgr0)"
echo "$(tput setab 2)tail -f /tmp/stdout.log$(tput sgr0)$(tput setaf 4) and $(tput sgr0)$(tput setab 2)tail -f /tmp/stderr.log$(tput sgr0)"
echo -e "\n"
echo "$(tput setaf 2)   _____                 _ _                _  $(tput sgr0)"
echo "$(tput setaf 2)  / ____|               | | |              | | $(tput sgr0)"
echo "$(tput setaf 2) | |  __  ___   ___   __| | |__  _   _  ___| | $(tput sgr0)"
echo "$(tput setaf 2) | | |_ |/ _ \ / _ \ / _\` | '_ \| | | |/ _ \| $(tput sgr0)"
echo "$(tput setaf 2) | |__| | (_) | (_) | (_| | |_) | |_| |  __/_| $(tput sgr0)"
echo "$(tput setaf 2)  \_____|\___/ \___/ \__,_|_.__/ \__, |\___(_) $(tput sgr0)"
echo "$(tput setaf 2)                                  __/ |        $(tput sgr0)"
echo "$(tput setaf 2)                                 |___/         $(tput sgr0)"