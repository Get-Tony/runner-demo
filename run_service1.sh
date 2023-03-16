#!/bin/bash
# EXAMPLE of how to run a playbook using ansible-runner.
# Anthony Pagan - 15/03/2023

# Verify service1 exists
if [ ! -d "services/service1" ]; then
    echo "ERROR: Please run 'configure_service1.sh' then try again. "
    exit 1
fi

# Run the environment
ansible-runner run services/service1 -p main.yml --rotate-artifacts 7
