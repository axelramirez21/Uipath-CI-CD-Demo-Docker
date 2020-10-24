# UiPath Dockerized Robot for CI/CD pipelines

A Docker image containing the UiPath Robot and the UiPath Orchestrator API Powershell module. Intended purpose to be used as part of a CI/CD pipeline.

## Content

* A Dockerfile which builds a dockerized UiRobot along with the UiPath Powershell module 

## Building the docker image

Test locally with:
```cmd
docker build -t uipath-robot .
```
Run locally with:
```cmd
docker run -it uipath-robot
```

## Building on Jenkins and Azure Registry 

1. Create an account with Azure and a subscription within the account.
2. Create a resource group and an Azure Container Registry within the RG.
3.  
4. Create a starter pipeline within the project, triggered by the GitHub repository hosting the code. Go through the steps to create the service principal on Azure which will allow the Azure DevOps pipeline to push the images to the ACR.
5. `git push -u origin` on branch master to trigger the pipeline and build the dockerized uipath-robot

## Jenkins  prerequisites:
