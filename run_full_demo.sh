#!/bin/bash
# This script is used to run the runner-demo
# Provide our proxy address as argument.

set -e

# Get the proxy URL as argument
if [ -z "$1" ]; then
    echo "No proxy URL provided."
    exit 1
fi

GIT_PROXY_URL=$1

# Run preinstall checks
./pre_install_checks.sh

# Clone and configure the demo service
HTTPS_PROXY=$GIT_PROXY_URL ./configure_service1.sh

# Run the demo service
HTTPS_PROXY=$GIT_PROXY_URL ./run_service1.sh
