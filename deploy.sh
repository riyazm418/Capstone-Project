#!/bin/bash
echo "Deploying Docker container using docker-compose..."
docker-compose -f docker-compose.yml up -d
