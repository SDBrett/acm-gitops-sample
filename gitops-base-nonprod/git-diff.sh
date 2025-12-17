## Commented out all content as it will not work with sample repo

# #!/bin/bash
# source git-diff.config

# CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
# MERGE_BRANCH=$SOURCE_ENV-$CURRENT_ENV-merge-$(date +%s) 

# function update_remote_url(){
#     if [[ $(git config --get remote.$SOURCE_ENV.url) != $SOURCE_GIT_URL ]]
#         then
#             echo "Updating url for git remote ${SOURCE_ENV} to ${SOURCE_GIT_URL}"
#             git remote set-url $SOURCE_GIT_URL
#         else
#             echo "Git remote $SOURCE_ENV has the correct url"
#     fi
# }

# echo "Testing if git remote for $SOURCE_ENV repo is configured"
# if git remote show $SOURCE_ENV >/dev/null 2>&1
#     then
#         echo "Found git remote configuration for $SOURCE_ENV repo"
#         echo "Testing if git remote $SOURCE_ENV has correct url"
#         update_remote_url
#     else
#         echo "Git configuration for $SOURCE_ENV not found, attempting to add"
#         git remote add $SOURCE_ENV $SOURCE_GIT_URL
# fi

# echo "Updating git repos"
# git remote update
# git pull origin main --rebase

# echo "Merger branch name: $MERGE_BRANCH"
# git checkout -b $MERGE_BRANCH
# git diff $MERGE_BRANCH $SOURCE_ENV/main -- . $(echo $EXCLUDED_FILES) > diff.patch

# echo "Patch file generated"
# if [[ $AUTOPATCH = "yes" ]]; then
#     patch --remove-empty-files -p1 < diff.patch
#     echo "Patch applied"
# fi

# echo "Exiting"
