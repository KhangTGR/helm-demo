# Remove files
rm $CHARTS_SOURCE_TAR
rm index.yaml

# Create necessary files
helm package charts/hello-world/
helm repo index --url $GITHUB_URL .

# Update & Commit to GitHub
git add .
git commit -m "$GITHUB_COMMIT_MESSAGE"
git push origin $GITHUB_REPO

# Update the chart repo
sleep 60
helm repo update myrepo