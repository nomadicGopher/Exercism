#!/bin/bash

# Check if the Exercism CLI is installed and configured
if ! command -v exercism &> /dev/null; then
    echo "Error: Exercism CLI is not installed. Please install and configure the Exercism CLI."
    exit 1
fi

# Check if the Exercism workspace is configured
WORKSPACE=$(exercism w 2>/dev/null)

if [ -z "$WORKSPACE" ]; then
    echo "Error: Exercism workspace is not configured. Please configure it using:"
    echo 'exercism configure -w "/path/to/exercises/workspace"'
    exit 1
fi

# Check if a track argument is provided; if not, exit with an error message
if [ -z "$1" ]; then
    echo "Error: No track specified. Please provide a track as an argument."
    echo "Usage: $0 <track>"
    exit 1
fi

# Set the track to the first argument in lowercase
TRACK=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Print the workspace path
echo "Exercism workspace is located at: $WORKSPACE"

# Prepare the API URL
API_URL="https://exercism.org/api/v2/tracks/$TRACK/exercises"

# Check if the API URL is reachable
HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$API_URL")
if [ "$HTTP_RESPONSE" -ne 200 ]; then
    echo "Error: Failed to reach the API URL. HTTP response code: $HTTP_RESPONSE"
    exit 1
fi

# Fetch exercises from the Exercism API
RESPONSE=$(curl -s "$API_URL")

# Extract exercise slugs using grep and sed
EXERCISES=$(echo "$RESPONSE" | grep -o '"slug":"[^"]*"' | sed 's/"slug":"//;s/"//')

# Check if any exercises were found
if [ -z "$EXERCISES" ]; then
    echo "No exercises found for track: $TRACK"
    exit 0
fi

# Print the list of exercise slugs
echo "Exercises for track '$TRACK':"
echo "$EXERCISES"

# Download each exercise using the Exercism CLI
for SLUG in $EXERCISES; do
    if ! exercism download -e "$SLUG" -t "$TRACK"; then
        echo "Error downloading exercise: $SLUG"
    else
        echo "Downloaded exercise: $SLUG"
    fi
done

echo "Process is finished."