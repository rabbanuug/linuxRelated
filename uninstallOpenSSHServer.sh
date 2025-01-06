#!/bin/bash

# Script to completely uninstall SSH server (OpenSSH) from the system.

echo "Starting the complete uninstallation of the SSH server..."

# Step 1: Stop the SSH service if it is running
echo "Stopping the SSH service..."
sudo systemctl stop ssh || echo "SSH service is not running or not installed."

# Step 2: Disable the SSH service from starting on boot
echo "Disabling the SSH service..."
sudo systemctl disable ssh || echo "SSH service is not enabled on boot."

# Step 3: Remove the SSH server package
echo "Removing the OpenSSH server package..."
sudo apt-get purge -y openssh-server || {
    echo "Failed to remove the OpenSSH server package. Exiting..."
    exit 1
}

# Step 4: Remove residual configuration files and logs
echo "Removing residual configuration files and logs..."
sudo rm -rf /etc/ssh /var/log/auth.log /var/log/secure || echo "No residual SSH configuration or logs found."

# Step 5: Remove user-specific SSH directories
echo "Removing user-specific SSH directories..."
find /home -name ".ssh" -type d -exec rm -rf {} + || echo "No user-specific SSH directories found."
rm -rf ~/.ssh || echo "No SSH directory found in the current user's home."

# Step 6: Auto-remove dependencies no longer needed
echo "Removing unnecessary dependencies..."
sudo apt-get autoremove -y || echo "No unnecessary dependencies to remove."

# Step 7: Clean up cached files
echo "Cleaning up cached files..."
sudo apt-get clean || echo "No cached files to clean."

echo "SSH server has been fully uninstalled and cleaned up."