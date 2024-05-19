#!/bin/bash
BRANCH_NAME='git rev-parse --abbrev-ref HEAD'
echo $BRANCH_NAME

if [ "$BRANCH_NAME" == "master" ]; then
  IMAGE_TAG="riyazm418/prod:devops-build-v1.0"
else
  IMAGE_TAG="riyazm418/dev:devops-build-v1.0"
fi

# echo "Building Docker image with tag ${IMAGE_TAG}..."
docker build -t $IMAGE_TAG .

# echo "Logging into Docker..."
docker login -u riyazm418 -p Rahila@100

# echo "Pushing Docker image to repository..."
docker push $IMAGE_TAG
