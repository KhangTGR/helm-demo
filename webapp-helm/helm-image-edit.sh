echo "=========================================="

echo -n "Enter your Docker account name: " && read docker_username
export DOCKER_USERNAME=$docker_username

echo -n "Enter your image repo name: " && read image_name
export IMAGE_NAME=$image_name

echo -n "Enter your image tag: " && read image_tag
export IMAGE_TAG=$image_tag

export REPO_URL=$DOCKER_USERNAME/$IMAGE_NAME

echo "=========================================="

sed -i "/repository:/c\  repository: $REPO_URL" ./charts/webapp-helm/values.yaml
sed -i "/tag:/c\  tag: $IMAGE_TAG" ./charts/webapp-helm/values.yaml

echo "File values.yaml edited successfully"