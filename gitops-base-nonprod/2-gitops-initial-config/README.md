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

Ths repo is opinionated with using the IPI installation method to deploy an OCP cluster onto a vSphere platform.

### TODO
- [ ] Add checks to ensure credentials are not pushed to git repo

## Repo structure

- `./gitops-init` Contains files required for the deployment of OpenShift GitOps to the mgt cluster
- `./root-apps` Contains configurations for root applications, these are deployed after OpenShift GitOps.

## System Requirements

The system used to provision a mgt cluster must meet the following prerequisites:
- MacOS or Linux OS
- oc and kubectl binaries
  - These are available from [console.redhat.com](https://console.redhat.com/openshift/install/vsphere/installer-provisioned)
- openshift-install binary for deploying the cluster
  - Available from [console.redhat.com](https://console.redhat.com/openshift/install/vsphere/installer-provisioned)
- Access to vCenter server
- Git
- ssh-keygen

## Assumptions

### Operator

It is assumed that operators working in this repository are familiar with the following:
- OpenShift deployment
- Operator management
- OpenShift GitOps
- Kustomize
  
- Access to console.redhat.com

### Credentials
- git repository credentials for this repo and ztp repo.
  - mgt-clusters/gitops-init/git-secrets-template.yaml