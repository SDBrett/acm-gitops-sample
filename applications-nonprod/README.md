# applications-nonprod

This repo is used by cluster admins to onboard and manage a limited set of resources for application owners.

It is expected that most application resources are managed by application owners from their own repos.

## Overview
Each application has an contains an `ApplicationSet` resource which is synchronized to the hub cluster. The `ApplicationSet` resource will create `Application` resources on the relevant workload clusters.

This application is placed in the `openshift-gitops` namespace as that is used for cluster management. This helps prevent privilege escalation with the application app of apps pattern.

A namespace with the suffix `-gitops` is created for each application. This namespace is where the argoCD `Application` resource is created for the application. This is another method to reduce the risk of privilege escalation from misconfiguration.

## Roles

**Cluster admins:**
- Onboarding of applications
  - This could be done directly or by approving PRs from application owners
- Managing cluster level resources
- Managing namespace level resources which must be present
  - For example a default deny all `NetworkPolicy`
- Creating initial `RoleBinding` for the application admins
- Reviewing and Approving PRs from Application owners

**Application Owners:**
- Configure and maintain their own application configuration repos
- Manage permissions within the namespace for different application management roles
- Create PRs for any changes required to resources managed in this repo
- Manage Git credential via the ArgoCD UI
- Maintaining the quality of the resources in their repo

## Directory Structure
Maintaining a consistent and logical directory structure is essential to reduce the management overhead required.

The directory `EXAMPLE-APP` provides an example structure for onboarding an application.