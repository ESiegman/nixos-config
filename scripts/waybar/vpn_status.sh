#!/usr/bin/env bash

# Retry logic to ensure the VPN status is checked correctly
VPN_INTERFACE="wgnord"
RETRY_COUNT=3
DELAY=1

if [ "$1" == "click-left" ]; then
    # Toggle VPN connection status on left click
    if sudo wg show $VPN_INTERFACE 2>/dev/null | grep -q 'interface: wgnord'; then
        # Disconnect if connected
        sudo wgnord d
    else
        # Connect to a default location, e.g., 'miami'
        sudo wgnord c miami
    fi
fi

for i in $(seq 1 $RETRY_COUNT); do
    # Check if WireGuard interface 'wgnord' is up
    if sudo wg show $VPN_INTERFACE 2>/dev/null | grep -q 'interface: wgnord'; then
        echo "VPN: Connected"
        exit 0
    else
        echo "VPN: Disconnected"
    fi
    sleep $DELAY
done

