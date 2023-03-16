#!/bin/bash
# Pre-install checks
# Anthony Pagan - 15/03/2023

REQUIRED_COMMANDS=(git ansible ansible-playbook ansible-runner)
MISSING_COMMANDS=()

for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command -v $cmd &>/dev/null; then
        MISSING_COMMANDS+=($cmd)
    fi
done

if [ ${#MISSING_COMMANDS[@]} -gt 0 ]; then
    echo "Missing commands: ${MISSING_COMMANDS[@]}"
    echo "Please install them and try again. See README.md for more information."
    exit 1
else
    echo "All required commands are installed. Please run configure_service1.sh"
fi
