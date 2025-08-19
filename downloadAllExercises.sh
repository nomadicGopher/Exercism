#!/bin/bash

# Check if a track argument is provided; if not, exit with an error message
if [ -z "$1" ]; then
    echo "Error: No track specified. Please provide a track as an argument."
    echo "Usage: $0 <track>"
    exit 1
fi

# Set the track to the first argument
TRACK="$1"

# Check if the exercism command is available
if ! command -v exercism &> /dev/null; then
    echo "Error: Exercism CLI not found. Please ensure you have it installed and configured."
    exit 1
fi

# Get Exercism workspace
WORKSPACE=$(exercism -w 2>/dev/null)

# Check if the exercism command was successful
if ! WORKSPACE; then
    echo "Error: Failed to retrieve Exercism workspace. Please ensure you have the Exercism CLI installed and fully configured."
    exit 1
fi

# Print the workspace path
echo "Exercism workspace is located at: $WORKSPACE"

# Fetch exercises from the Exercism API
API_URL="https://exercism.org/api/v2/tracks/$TRACK/exercises"
RESPONSE=$(curl -s "$API_URL")

# Check if the API call was successful
if ! curl -s "$API_URL"; then
    echo "Error: Failed to fetch exercises from the API."
    exit 1
fi

# Parse the JSON response to extract exercise slugs
EXERCISES=$(echo "$RESPONSE" | jq -r '.exercises[] | .slug')

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
    DOWNLOAD_OUTPUT=$(exercism download -e "$SLUG" -t "$TRACK" 2>&1)
    if ! exercism download -e "$SLUG" -t "$TRACK"; then
        echo "Error downloading exercise: $SLUG"
        echo "Details: $DOWNLOAD_OUTPUT"
    else
        echo "Downloaded exercise: $SLUG"
    fi
done

echo "All exercises have been processed."
