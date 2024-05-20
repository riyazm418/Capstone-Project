#!/bin/bash
docker-compose down && docker-compose -p prod up -f docker-compose.yml -d
