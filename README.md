# mac-blue-kepp-alive
Bluetooth connection maintainer
This script will keep a bluetooth connection alive by checking if the device is connected every X minutes and if not, it will try to connect to it.

## Why?
I have a bluetooth speaker that I use with my mac. I noticed that when my mac goes to sleep, the bluetooth connection is lost and I have to reconnect to the speaker every time I wake up my mac. This script will keep the connection alive.

## Requirements
- [blueutil](https://github.com/toy/blueutil)
- [python3](https://www.python.org/downloads/)
## Usage
1. Pair your bluetooth device with your mac
2. Install [blueutil](https://github.com/toy/blueutil) with `brew install blueutil`
3. Clone this repo `git clone https://github.com/MendyLanda/mac-blue-keep-alive.git`
4. cd into the repo folder `cd mac-blue-keep-alive`
5. Modify run.sh to include your bluetooth device name and other settings
6. Run `chmod +x run.sh && ./run.sh`

## How to stop the script
- run `crontab -e` and remove the line that was added by the script

## Configuration
- `DEVICE_NAME` - the name of the bluetooth device you want to keep alive
- `CHECK_INTERVAL` - the interval in minutes to check if the device is connected
- `PATH_TO_SCRIPT` - the path to the python script (default is the current directory main.py)
- `PYTHON_RUNNER` - the python runner (default is python3)

## Troubleshooting
- To see the logs run:
  - `tail -f /tmp/stdout.log`
  - `tail -f /tmp/stderr.log` for errors
## Notes
- This script is working for me, but I'm not a bash expert. If you have any suggestions, please let me know.
- Python is not really needed for this script, but I'm more familiar with it than bash.
- I'm not sure if this is the best way to keep a bluetooth connection alive, but it works for me.

## License
MIT License

## Author
- [Mendy Landa](https://github.com/MendyLanda)