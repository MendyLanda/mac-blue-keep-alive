# mac-blue-kepp-alive
Bluetooth connection maintainer

# Requirements
- cli [blueutil](https://github.com/toy/blueutil) must be installed
  - install with `brew install blueutil`
## Usage
1. Install [blueutil](https://github.com/toy/blueutil) with `brew install blueutil`
2. Clone this repo
3. cd into the repo folder
4. modify run.sh to include your bluetooth device name and other settings
5. run `chmod +x run.sh && ./run.sh`

# Configuration
- `DEVICE_NAME` - the name of the bluetooth device you want to keep alive
- `CHECK_INTERVAL` - the interval in minutes to check if the device is connected
- `PATH_TO_SCRIPT` - the path to the python script (default is the current directory main.py)
- `PYTHON_RUNNER` - the python runner (default is python3)

# Troubleshooting
- To see the logs run:
  - `tail -f /tmp/stdout.log`
  - `tail -f /tmp/stderr.log` for errors
# Notes
- This script is working for me, but I'm not a bash expert. If you have any suggestions, please let me know.
- Python is not really needed for this script, but I'm more familiar with it than bash.
- I'm not sure if this is the best way to keep a bluetooth connection alive, but it works for me.

## License
MIT License

## Author
- [Mendy Landa](https://github.com/MendyLanda)