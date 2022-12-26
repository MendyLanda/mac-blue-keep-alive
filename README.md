mac-blue-keep-alive
===================

Bluetooth connection maintainer This script will keep a bluetooth connection alive by checking if the device is connected every X minutes and if not, it will try to connect to it.

Why?
----

I have a bluetooth speaker that I use with my mac. I noticed that when my mac goes to sleep, the bluetooth connection is lost and I have to reconnect to the speaker every time I wake up my mac. This script will keep the connection alive.

Requirements
------------

*   [blueutil](https://github.com/toy/blueutil)
*   [jq](https://stedolan.github.io/jq/)

Usage
-----

1.  Install [blueutil](https://github.com/toy/blueutil) with `brew install blueutil`
2.  Install [jq](https://stedolan.github.io/jq/) with `brew install jq`
3.  Clone this repo `git clone https://github.com/MendyLanda/mac-blue-keep-alive.git`
4.  cd into the repo folder `cd mac-blue-keep-alive`
5.  Pair your bluetooth device with your mac
6.  Modify `run.bash` to include your bluetooth device name and other settings
7.  Run `chmod +x run.bash && ./run.bash`

How to stop the script
----------------------

*   run `crontab -e` and remove the line that was added by the script
*   alternatively, you can clear all cron jobs by running `crontab -r`

Configuration
-------------

*   `DEVICE_NAME` - the name of the bluetooth device you want to keep alive
*   `CHECK_INTERVAL` - the interval in minutes to check if the device is connected

Troubleshooting
---------------

*   To see the logs run:
    *   `tail -f /tmp/stdout.log`
    *   `tail -f /tmp/stderr.log` for errors

Notes
-----

*   This script is working for me, but I'm not a bash expert. If you have any suggestions, please let me know.
*   The script no longer uses Python and the `PYTHON_RUNNER` setting has been removed.