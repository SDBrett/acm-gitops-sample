#  A Method of promoting changes.

> This Relies on tagging the commits when a change was promoted.

> This process should not be done without stringent checks on the PATCH FILE and what is committed and what is in the pull-request.



    git checkout main
    git tag model-dev-`date +%d%m` & git tag -l "dev-model*" --sort=committerdate | tail -2 | xargs git diff > promote-model-dev-`date +%d%m`.patch


Edit the above patch file looking for things like "dev" IP Addresses URLs etc to remove those patch sections.  See TODO below for a list of common strings to search for.



    cp promote-dev-model-`date +%d%m`.patch $MODEL-DIR/
    cd $MODEL-DIR
    git checkout -b promote-dev-model-`date +%d%m`
    patch -p1 < promote-dev-model-`date +%d%m`.patch
    ## Use your tooling of choice to check the changes to be committed.
    #vscode git view with changes.
    git status
    git diff HEAD^



When you are satisfied with the changes


    git commit -m "promote-dev-model-`date +%d%m`"
    git tag dev-model-`date +%d%m`
    git push

Create a pull-request with review for the promotion.


> Note need to check the type of pull-request used for ADO to make sure the commit above comes through with the tag on it.







## TODO
### Strings to search to exclude in the diff functions or to search for in the patch to remove those lines
    's/unix-openshift-dev/unix-openshift-model/g'
    's/dev-pak/model-pak/g
    's/10./ -> ????/g
### File avoidance for known bad files
Should add some .gitatributes to force Keep Ours merge strategy on known files, e.g. ArgoCD Application files, when merging from the promotion branch into main.

List so far:
    mgt-clusters/root-apps/overlays/
    mgt-clusters/openshift-gitops/acm-app.yaml
    mgt-clusters/openshift-gitops/gitops-root-app.yaml
    mgt-clusters/gitops-init/git-secrets-template.yaml
    mgt-clusters/root-apps/bases/ACM/README.md
    openshift-gitops/ztp-gitops/appproject-policy.yaml
    openshift-gitops/ztp-gitops/policies-app.yaml
    openshift-gitops/ztp-gitops/appproject-ztp.yaml
    openshift-gitops/ztp-gitops/git-secrets-template.yaml
    openshift-gitops/ztp-gitops/clusters-app.yaml
    openshift-gitops/applications/
    .git/