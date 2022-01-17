#!/bin/bash

##********************************************************************************************************************##
##
## Copyright (C) 2018 - 2022 J&J Ideenschmiede GmbH <info@jj-ideenschmiede.de>
##
## All code may be used. Feel free and maybe code something better.
##
## Author: Jonas Kwiedor (aka gowizzard)
##
##********************************************************************************************************************##

# Define configuration variables
name="goten"
path="/usr/local/lib/${name}"

# Function to log a result
function log_result() {
	echo "********************************************************************************"
	echo "$1"
	echo "********************************************************************************"
}

# Check arguments
case $1 in

"-b" | "--build")

	# Build the go project
	go build -o "$name"

	# Set permissions
	chmod u+x "$name"

	# Log result
	log_result "Build successful"

	# Exit without errors
	exit 0;;

"-i" | "--install")

	# Create the folder
	mkdir -p "$path"

	# Copy file to /usr/local/lib
	cp "$name" "${path}/${name}"

	# Remove old symlink
	rm "/usr/local/bin/${name}" > /dev/null 2>&1

	# Install the go project to the system
	ln -s "${path}/${name}" "/usr/local/bin/${name}" > /dev/null 2>&1

	# Log result
	log_result "Install successful"

	# Exit without errors
	exit 0;;

*)

	# Log error
	log_result "No arguments could be found. Please use --build to build the go project and --install to install it."

	# Exit with error
	exit 1;;

esac
