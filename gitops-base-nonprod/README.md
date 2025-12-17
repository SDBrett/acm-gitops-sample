# mgt Clusters <!-- omit in toc -->

- [Introduction](#introduction)
  - [TODO](#todo)
- [Repo structure](#repo-structure)
- [System Requirements](#system-requirements)
- [Assumptions](#assumptions)
  - [Operator](#operator)
  - [Credentials](#credentials)


## Introduction

This repo provides the required files to bootstrap the provisioning and configuration of a mgt cluster. This repo is also the point of management for the instance of ACM deployed on a mgt cluster.

Management of an ACM instance has been separated from other configuration repositories for the purpose of managing user access requirements.


## Repo structure

- `./gitops-init` Contains files required for the deployment of OpenShift GitOps to the mgt cluster
- `./root-apps` Contains configurations for root applications, these are deployed after OpenShift GitOps.

## How to use
This repo is handled via a hub deployment pipeline. Pipeline definition is on the day 2 repo under acm folder.


## Assumptions

### Operator

It is assumed that operators working in this repository are familiar with the following:
- OpenShift deployment
- Operator management
- OpenShift GitOps
- Kustomize
  
- Access to console.redhat.com

## HUB cluster build/design information
Will be stored in <hubclustername>-README.md
- Secrets will be copied to the HUB cluster via pipeline Openshift ACM deploy secret
- A copy of the secret needs to be stored in the UNIX keepass
- ACM will use the policy copy function to push secrets to the managed cluster.

## Repository structure

### Deployment of git ops operator

The deployment process uses Kustomize to create the required Kubernetes resources and trigger the deployment of the OpenShift GitOps Operator.

  - target folder `gitops-init` 

The operator deployment normally takes about 5-10 minutes.


### Argocd default instance

This deployment phase deploys an instance of OpenShift GitOps to the cluster and creates `Application.argoproj.io/v1alpha1` resources which trigger a cascade of configuration changes to the mgt cluster.

**Note:** OpenShift GitOps is built on ArgoCD, the terminology will change to specify ArgoCD resources such as applications.

### ArgoCD Instance

The file `./openshift-gitops/openshift-gitops-instance.yaml` defines an instance of ArgoCD. The OpenShift GitOps operator reads the resource manifest when it's applied to the cluster and this triggers the deployment of the application. 

### ArgoCD Applications 

The ArgoCD instance uses `Application.argoproj.io/v1alpha1` to determine what resources to consume from what git repositories. ArgoCD clones the specified git repositories and applies the rendered resources to the cluster.

In the context of a mgt cluster several application resources are created on the cluster initially, then more are created.

Application resources are:
- mgt-cluster-acm which triggers the deployment of Red Hat Advanced Cluster Management to the mgt cluster. This application synchronizes resources from the `./root-apps` directory in the repository.
- acm-applications triggers the synchronization of applications from the `openshift-gitops/applications` directory in the ACM repository. The applications created through this synchronization are the applications which synchronize resources for ACM such as configuration policies and placements.

### Configuration via ACM

After ACM has been deployed it will consume the resources by the applications in the ACM repository. Many baseline policies are configured to make changes when ACM detects violations. This process means that the baseline configuration of the mgt cluster has begun.
