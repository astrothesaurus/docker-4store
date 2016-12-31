#!/bin/bash
set -e

if [ ! -f /init-done ]; then
    echo "Initialising 4store.."

    # Create default store
    4s-backend-setup default
    4s-backend default
	4s-import default -fturtle -mhttp://data.iop.org/uat_review metadata.nt
	4s-import default -frdfxml -mhttp://data.iop.org/thesaurus/2016R3 thesaurus.rdf
    touch /init-done
fi

# Run the requested command
exec "$@"
