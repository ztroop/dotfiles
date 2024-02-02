#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="./lua"
DEST_DIR="$HOME/.config/nvim/lua"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory $SOURCE_DIR does not exist. Exiting."
    exit 1
fi

# Remove the destination directory if it exists
if [ -d "$DEST_DIR" ]; then
    echo "Removing existing directory: $DEST_DIR"
    rm -rf "$DEST_DIR"
fi

# Copy the contents from the source to the destination
echo "Copying contents from $SOURCE_DIR to $DEST_DIR"
cp -r "$SOURCE_DIR" "$DEST_DIR"

echo "Operation completed."

