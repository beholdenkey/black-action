#!/bin/bash
set -e

# Print a debug statement, which can be helpful in troubleshooting.
echo "Running black with arguments: $*"

# Check if any arguments were passed in, if not, print a helpful message and exit.
if [ $# -eq 0 ]; then
    echo "No arguments provided to black, please check your command."
    exit 1
fi

# Use exec so that the final running application becomes the container's PID 1, allowing it to receive any Unix signals sent to the container.
exec black "$@"
