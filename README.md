# DevOps Bootcamp Level 3 Final Project

The project goal is to build and deploy Sock Shop website [Weaveworks Shock Shop demo](https://github.com/microservices-demo) with k8s.

## To Run The Project

Use the [Makefile](https://github.com/rayanah/level-3-project/blob/main/Makefile).  
##### Note: it's better to run the project in 2xlarge aws instance 

```bash
make up
```
This command will create the cluster and configure the platform to run the project and create namespace that needed ,and run the tekton pipelines that will run multiple tasks: build and push docker images and, deploy to test namespace ,and run the e2e test, and finally after passing the test will deploy it to production.

## Project Folder
Each micro-service has its own file, you can access takton yaml file code in "try1" folder in each service. you can see also the Dockerfile that build the images and pushed in DockerHup.
And the deployment folder for each service is SERVICENAME-dep-ser.yaml and if contains db SERVICENAMEdb-dep-ser.yaml
 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
