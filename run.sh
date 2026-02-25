#!/bin/bash

# Source the renamed secrets file
source .secrets.env

if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "Error: ANTHROPIC_API_KEY is not set."
    exit 1
fi

if [ -z "$OPENAI_API_KEY" ]; then
    echo "Error: OPENAI_API_KEY is not set."
    exit 1
fi

if [ -z "$GEMINI_API_KEY" ]; then
    echo "Error: GEMINI_API_KEY is not set."
    exit 1
fi
# Start the proxy in the background
docker-compose up -d proxy

# Run the agent interactively
docker-compose run --rm agent
