#!/bin/bash

set -e

# Check if the team name is provided
if [ -z "$1" ]; then
  echo "Error: Team name is required."
  echo "Usage: $0 [team name] [port]"
  exit 1
fi

# Check if the port is provided
if [ -z "$2" ]; then
  echo "Error: Port number is required."
  echo "Usage: $0 [team name] [port]"
  exit 1
fi

# Assign arguments to variables for clarity
TEAM_NAME=$1
export PORT=$2

cd "$(git rev-parse --show-toplevel)"
git pull origin dev
docker compose --project-name $TEAM_NAME -f docker/team-deploy/docker-compose.yml up -d
