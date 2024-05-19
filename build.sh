# #!/bin/bash
# echo "Building Docker image..."
# docker build -t devops-build:v1.0 .

# echo "Logging into Docker..."
# docker login -u riyazm418 -p Rahila@100

# echo "Pushing Docker image to repository..."
# docker tag devops-build:v1.0 riyazm418/dev:devops-buil-v1.0
# docker push riyazm418/dev:devops-buil-v1.0
# docker tag devops-build:v1.0 riyazm418/prod:devops-buil-v1.0
# docker push riyazm418/prod:devops-buil-v1.0



#!/bin/bash
BRANCH_NAME='git rev-parse --abbrev-ref HEAD'
#IMAGE_TAG="riyazm418/devops-build:latest"
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
# docker tag devops-build:dev riyazm418/dev:devops-build-dev
# docker tag devops-build:prod riyazm418/prod:devops-build-prod
docker push $IMAGE_TAG
