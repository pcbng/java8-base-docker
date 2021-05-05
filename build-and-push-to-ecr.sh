#!/bin/bash

export ECR_REGION="us-east-1"
export IMAGE_NAME="java8-base"
export IMAGE_TAG="8s.02"

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)

ECR_URL="$AWS_ACCOUNT_ID.dkr.ecr.$ECR_REGION.amazonaws.com"

$(aws ecr get-login --no-include-email --region $ECR_REGION)

docker build -t $IMAGE_NAME:$IMAGE_TAG .
docker tag $IMAGE_NAME:$IMAGE_TAG $ECR_URL/$IMAGE_NAME:$IMAGE_TAG
docker push $ECR_URL/$IMAGE_NAME:$IMAGE_TAG