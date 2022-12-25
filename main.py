# a small program for connecting to a bluetooth device given its name

import argparse
import subprocess
import sys
import json

# Parse arguments
parser = argparse.ArgumentParser(
    usage="""python3 main.py [name of device]""",
    description="Connect to a bluetooth device given its name"
)
parser.add_argument("device_name", type=str, help="Name of the device to connect to")
args = parser.parse_args()

def run_cmd_with_output(cmd: list[str]) -> str:
    """Run a command and return the output as a string"""
    output = subprocess.run(cmd, stdout=subprocess.PIPE).stdout.decode('utf-8')
    return output.strip()

def connect(device_name: str):
    """Connect to a bluetooth device given its name using blueutil"""
    # check if bluetooth is on
    ble_status = run_cmd_with_output(["blueutil",  "-p"])
    if ble_status == "0":
        print("Bluetooth is off")
        return
    elif ble_status != "1":
        print("Failed to get bluetooth status")
        return
    
    # Get paired devices
    output = run_cmd_with_output(["blueutil", "--format", "json", "--paired"])
    json_paired_devices = json.loads(output)
    
    # Find our device
    device = None
    for d in json_paired_devices:
        if d["name"] == device_name:
            device = d
            break
        
    # If device is not paired
    if device is None:
        print("Device is not paired")
        return
    
    # Check if device is connected
    if device["connected"]:
        print("Device is already connected")
        return
    
    # Connect to device
    print(f"Connecting to {device['name']}...")
    try:
        run_cmd_with_output(["blueutil", "--connect", device["address"]])
    except:
        print("Failed to connect to device")
        return
    
    print("Device is connected")
    
if __name__ == "__main__":
    connect(args.device_name)