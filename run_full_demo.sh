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

# Clone runner-demo repo
HTTPS_PROXY=$GIT_PROXY_URL git clone https://github.com/Get-Tony/runner-demo.git

# If runner-demo exists cd into it
if [ -d runner-demo ]; then
    cd runner-demo
else
    echo "runner-demo was not sucessfully cloned"
    exit 1
fi

# Run preinstall checks
./pre_install_checks.sh

# Clone and configure the demo service
HTTPS_PROXY=$GIT_PROXY_URL ./configure_service1.sh

# Run the demo service
HTTPS_PROXY=$GIT_PROXY_URL ./run.sh
