
**Not validated**

This content can be used to automate the deployment of ODF on storage nodes.

The job sets the master nodes as schedulable so the local storage operator can discover disks on the master nodes. The storage class would be configured in operators/local-storage-operator or environments/ENVIRONMENT/CLUSTER_NAME

It will then create a config-map in the openshift-storage namespace which is used as a dependency for the ODF creation of the ODF `StorageCluster` resource.

The job will wait until the storage cluster resource is healthy before it sets the master nodes as unschedulable.

The job creates a new entry in the config map to flag as deployed which prevents it from running again.

References: 
- https://access.redhat.com/solutions/6960451
- https://access.redhat.com/articles/6408481
