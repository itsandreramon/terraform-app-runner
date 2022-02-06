#!/bin/bash
export $(xargs <.env)

IMAGE_IDENTIFIER=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${TF_VAR_repository}:${TF_VAR_service}

docker login \
    -u AWS \
    -p $(aws ecr get-login-password --region ${AWS_REGION}) \
    ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

docker tag ${TF_VAR_service}:latest $IMAGE_IDENTIFIER
docker push $IMAGE_IDENTIFIER