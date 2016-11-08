#!/bin/bash
set -e

if [ ! -f /init-done ]; then
    echo "Initialising 4store.."

    # Create default store
    4s-backend-setup default

    touch /init-done
fi

# Run the requested command
exec "$@"
