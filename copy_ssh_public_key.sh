#!/bin/bash

# List of servers to copy the SSH key to
servers=("host1.abc.com" "host2.abc.com") 

# Path to the public key file
public_key_file="$HOME/.ssh/id_rsa.pub"

#echo "using publich key file: $public_key_file"

# Path to the encrypted password file
encrypted_password_file="password.enc"

# Decrypt the password
password=$(openssl enc -aes-256-cbc -d -in "$encrypted_password_file" -pass pass:your_encryption_passphrase)

# Loop through each server and copy the SSH key
for server in "${servers[@]}"; do
    echo "Using public key file: $public_key_file"
    echo "Copying SSH key to $server"
    sshpass -p "$password" ssh-copy-id -i "$public_key_file" -o StrictHostKeyChecking=no "$server"
done
