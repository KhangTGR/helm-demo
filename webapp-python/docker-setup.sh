#! /bin/bash

echo "Do you want to login your DockerHub account?" 
echo -n "\tAnswer either 'yes' or 'no': " && read answer

if [ $answer = "yes" ]; then
    docker login
elif [ $answer = "no" ]; then
    echo "=========================================="

    echo -n "Enter your Docker account name: " && read docker_username
    export DOCKER_USERNAME=$docker_username

    echo -n "Enter your image repo name: " && read image_name
    export IMAGE_NAME=$image_name

    echo -n "Enter your image tag: " && read image_tag
    export IMAGE_TAG=$image_tag

    export REPO_URL=$DOCKER_USERNAME/$IMAGE_NAME

    echo "=========================================="

    docker rmi -f $REPO_URL:$IMAGE_TAG

    docker build -q --platform=linux/amd64 -t $REPO_URL:$IMAGE_TAG .
    docker push -q $REPO_URL:$IMAGE_TAG

    rm -rf .env
else
    echo "Please specify answer 'yes' or 'no'"
fi