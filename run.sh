# set variable device_name to the name of the device you want to use
DEVICE_NAME="REPLACE WITH DEVICE NAME"

# set variable check_interval to the number of minutes between checks
# value must be between 1 and 59
CHECK_INTERVAL="1"

# set variable path_to_python_script to the path to the python script main.py
# default is the current directory main.py (pwd/main.py)
PATH_TO_SCRIPT="$(pwd)/main.py"

# set variable python_run to the name of python executable
# in most cases, this will be python3 or python
PYTHON_RUNNER="python3"
# ---------------------------------------------------------------
# don't edit below this line unless you know what you're doing
# ---------------------------------------------------------------

set -e

# create a cron job to run the python script main.py every checkinterval minutes
# PATH is set to the current path so that the python script can find the modules
(crontab -l 2>/dev/null; echo "PATH=$PATH\n*/$CHECK_INTERVAL * * * * $PYTHON_RUNNER $PATH_TO_SCRIPT '$DEVICE_NAME' >/tmp/stdout.log 2>/tmp/stderr.log") | crontab -