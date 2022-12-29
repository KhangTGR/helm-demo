# Remove files
rm hello-demo-0.1.0.tgz
rm index.yaml

# Create necessary files
helm package charts/hello-world/
helm repo index --url https://khangtgr.github.io/helm-demo/ .

# Update & Commit to GitHub
git status
git add .
git commit -m ""
git push origin main

# Update the chart repo
sleep 90
helm repo update myrepo