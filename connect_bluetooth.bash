#!/bin/bash

# Check if device name is provided
if [[ -z "$1" ]]; then
  echo "Device name is not provided"
  exit 1
fi

# Check if bluetooth is on
ble_status=$(blueutil -p)
if [[ "$ble_status" == "0" ]]; then
  echo "Bluetooth is off"
  exit 1
elif [[ "$ble_status" != "1" ]]; then
  echo "Failed to get bluetooth status"
  exit 1
fi

# Get paired devices
output=$(blueutil --format json --paired)
json_paired_devices=$(echo "$output" | jq -r '.')

# Find our device
device=$(echo "$json_paired_devices" | jq -r ".[] | select(.name == \"$1\")")

# If device is not paired
if [[ -z "$device" ]]; then
  echo "Device is not paired"
  exit 1
fi

# Check if device is connected
connected=$(echo "$device" | jq -r '.connected')
if [[ "$connected" == "true" ]]; then
  echo "Device is already connected"
  exit 0
fi

# Connect to device
echo "Connecting to $1..."
if ! blueutil --connect "$(echo "$device" | jq -r '.address')"; then
  echo "Failed to connect to device"
  exit 1
fi

echo "Device is connected"