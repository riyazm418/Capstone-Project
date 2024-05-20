#!/bin/bash
docker-compose down && docker-compose -p dev up -f docker-compose.yml -d
