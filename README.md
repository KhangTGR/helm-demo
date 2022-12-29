
Refference: https://www.opcito.com/blogs/creating-helm-repository-using-github-pages

# Helm chart repo on GitHub instructions
## Step 1 | Prepare a 'charts' folder that contains all the chart files
In this tutorial, I chose 'hello-world' chart which I already have. 

    charts
    └── hello-world
        ├── Chart.yaml
        ├── templates
        │   ├── deployment.yaml
        │   ├── _helpers.tpl
        │   ├── hpa.yaml
        │   ├── ingress.yaml
        │   ├── NOTES.txt
        │   ├── serviceaccount.yaml
        │   ├── service.yaml
        │   └── tests
        │       └── test-connection.yaml
        └── values.yaml

This is an **optional** choice, yet make sure that the charts run without flaws. Use command:

    helm lint charts/hello-world

If it show like in the below, then it runs.

    ==> Linting charts/hello-world
    [INFO] Chart.yaml: icon is recommended

    1 chart(s) linted, 0 chart(s) failed

Next, add robots.txt at the root location of the repository. This will avoid bot crawling on the Helm repository. 

    echo -e “User-Agent: *\nDisallow: /” > robots.txt 


