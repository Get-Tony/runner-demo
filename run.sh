#!/bin/bash
# EXAMPLE of how to run a playbook using ansible-runner.
# Anthony Pagan - 15/03/2023

# Early exit if missing commands
REQUIRED_COMMANDS=(git ansible ansible-playbook ansible-runner)

for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command -v $cmd &>/dev/null; then
        echo "Command '$cmd' not found. Please install it and try again."
        exit 1
    fi
done

# Clone the demo service repo
if [ ! -d "services/service1" ]; then
    git clone https://github.com/get-tony/service_service1.git services/service1
fi

# Verify the service repo exists
if [ ! -d "services/service1/inventory/host_vars" ]; then
    echo "ERROR: The service repo does not exist or is not configured. See its README.md"
    exit 1
fi

# Run the environment
ansible-runner run services/service1 -p main.yml --rotate-artifacts 7
