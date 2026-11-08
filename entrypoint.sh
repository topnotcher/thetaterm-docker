#!/bin/sh
# Start the ThetaData terminal.
#
# THETADATA_API_KEY_FILE: log in with the API key in this file (e.g. a
# Docker secret). The terminal itself reads the key from
# THETADATA_API_KEY, so it is set here, in the terminal's environment
# only, and stays out of the container's configuration.
#
# THETADATA_CREDS_FILE: log in with the email address and password in
# this file, one per line.
#
# Neither: the terminal looks for THETADATA_API_KEY, a .env file or
# creds.txt itself.
set -eu

if [ -n "${THETADATA_API_KEY_FILE:-}" ]; then
    THETADATA_API_KEY=$(cat "$THETADATA_API_KEY_FILE")
    if [ -z "$THETADATA_API_KEY" ]; then
        echo "entrypoint: $THETADATA_API_KEY_FILE is empty" >&2
        exit 1
    fi
    export THETADATA_API_KEY
    exec java -jar ThetaTerminal.jar
elif [ -n "${THETADATA_CREDS_FILE:-}" ]; then
    exec java -jar ThetaTerminal.jar --creds-file "$THETADATA_CREDS_FILE"
else
    exec java -jar ThetaTerminal.jar
fi
