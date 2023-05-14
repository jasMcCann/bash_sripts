#!/bin/bash

# Set the username for the new user
username="newuser"

# Set the path to the public key file
public_key_file="/path/to/public_key.pub"

# Create a new user
sudo useradd -m -s /bin/bash "$username"

# Set the user's password (optional)
sudo passwd "$username"

# Create an SSH directory for the user
sudo mkdir /home/"$username"/.ssh

# Set the appropriate permissions
sudo chmod 700 /home/"$username"/.ssh
sudo chown "$username":"$username" /home/"$username"/.ssh

# Add the public key to the authorized_keys file
sudo cat "$public_key_file" >> /home/"$username"/.ssh/authorized_keys

# Set the appropriate permissions for the authorized_keys file
sudo chmod 600 /home/"$username"/.ssh/authorized_keys
sudo chown "$username":"$username" /home/"$username"/.ssh/authorized_keys

# Restart the SSH service (optional)
sudo systemctl restart sshd

echo "New user '$username' has been created and the public key has been added."
