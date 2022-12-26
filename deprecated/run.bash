#!/bin/bash
# note: this script is deprecated in favor of a new bash only script. 
# I left it here in case you want to use the python script instead
set -e

# =====================================================
# Basic configurations
# =====================================================

# Set variable DEVICE_NAME to the name of the device you want to use
DEVICE_NAME="REPLACE WITH DEVICE NAME"


# =====================================================
# Advance configurations
# =====================================================

# Set variable CHECK_INTERVAL to the number of minutes between checks
# Value must be between 1 and 59
CHECK_INTERVAL=1

# Set variable PATH_TO_SCRIPT to the path to the python script main.py
# Default is the current directory main.py (pwd/main.py)
PATH_TO_SCRIPT="$(pwd)/main.py"

# Set variable PYTHON_RUNNER to the name of the python executable
# In most cases, this will be python3 or python
PYTHON_RUNNER="python3"


# =====================================================
# Don't edit below this line unless you know what you're doing
# =====================================================

( crontab -l 2>/dev/null; echo -e "PATH=$PATH \n*/$CHECK_INTERVAL * * * * $PYTHON_RUNNER $PATH_TO_SCRIPT '$DEVICE_NAME' >/tmp/stdout.log 2>/tmp/stderr.log") | crontab - || {
