#!/bin/bash
docker build -t devops-build:v1.0 .
docker login -u riyazm418 -p Rahila@100
docker tag devops-build:v1.0 riyazm418/dev:devops-buil-v1.0
docker push riyazm418/dev:devops-buil-v1.0

docker login -u riyazm418 -p Rahila@100
docker tag devops-build:v1.0 riyazm418/prod:devops-buil-v1.0
docker push riyazm418/prod:devops-buil-v1.0
