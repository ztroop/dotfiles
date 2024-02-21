#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="./lua"
DEST_DIR="$HOME/.config/nvim/lua"

# Function to copy from source to destination
copy_to_config() {
    echo "Copying contents from $SOURCE_DIR to $DEST_DIR"
    mkdir -p "$DEST_DIR"
    cp -r "$SOURCE_DIR" "$DEST_DIR"
}

# Function to copy from destination to source
copy_from_config() {
    echo "Copying contents from $DEST_DIR to $SOURCE_DIR"
    cp -r "$DEST_DIR" "$SOURCE_DIR"
}

# Check for the required argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 [to_config | from_config]"
    exit 1
fi

# Perform the operation based on the argument
case $1 in
    to_config)
        if [ ! -d "$SOURCE_DIR" ]; then
            echo "Source directory $SOURCE_DIR does not exist. Exiting."
            exit 1
        fi

        if [ -d "$DEST_DIR" ]; then
            echo "Removing existing directory: $DEST_DIR"
            rm -rf "$DEST_DIR"
        fi

        copy_to_config
        ;;
    from_config)
        if [ ! -d "$DEST_DIR" ]; then
            echo "Destination directory $DEST_DIR does not exist. Exiting."
            exit 1
        fi

        if [ -d "$SOURCE_DIR" ]; then
            echo "Removing existing directory: $SOURCE_DIR"
            rm -rf "$SOURCE_DIR"
        fi

        copy_from_config
        ;;
    *)
        echo "Invalid argument. Use 'to_config' or 'from_config'."
        exit 1
        ;;
esac

echo "Operation completed."

