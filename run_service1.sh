#!/bin/bash
# EXAMPLE of how to run a playbook using ansible-runner.
# Anthony Pagan - 15/03/2023

# Verify service1 exists
if [ ! -d "services/service1" ]; then
    echo "ERROR: Please run 'configure_service1.sh' then try again. "
    exit 1
fi

# Get the proxy URL as argument
if [ -z "$1" ]; then
    echo "No proxy URL provided. Trying direct access."
fi

GIT_PROXY_URL=$1

# If the proxy URL is provided, apply it before executing the service
if [ -n "$GIT_PROXY_URL" ]; then
    HTTPS_PROXY=$GIT_PROXY_URL ansible-runner run services/service1 -p main.yml --rotate-artifacts 7
else
    ansible-runner run services/service1 -p main.yml --rotate-artifacts 7
fi

# If failed, inform about the proxy URL argument
if [ $? -ne 0 ]; then
    echo "ERROR: Execution failed. Try providing a proxy URL as an argument."
fi
