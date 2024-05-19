#!/bin/bash
BRANCH_NAME='git rev-parse --abbrev-ref HEAD'
echo $BRANCH_NAME

if [ "$BRANCH_NAME" == "master" ]; then
  docker build -t devops-build:v1.0
  docker login -u riyazm418 -p Rahila@100
  docker tag devops-build:v1.0 riyazm418/prod:devops-buil-v1.0
  docker push riyazm418/prod:project01
else
  docker build -t devops-build:v1.0
  docker login -u riyazm418 -p Rahila@100
  docker tag devops-build:v1.0 riyazm418/dev:devops-buil-v1.0
  docker push riyazm418/dev:project02
fi

# echo "Building Docker image with tag ${IMAGE_TAG}..."
# docker build -t $IMAGE_TAG .

# echo "Logging into Docker..."

# echo "Pushing Docker image to repository..."
# docker push $IMAGE_TAG
