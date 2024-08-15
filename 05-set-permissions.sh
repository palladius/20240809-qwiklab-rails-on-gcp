#!/bin/bash

function _fatal() {
    echo "[FATAL] $*" >&1
    exit 42
}
function _after_allgood_post_script() {
    echo "[$0] All good on $(date)"
    CLEANED_UP_DOLL0="$(basename $0)"
    touch .executed_ok."$CLEANED_UP_DOLL0".touch
}

# Created with codelabba.rb v.2.3
# You can use `direnv allow` to make this work automagically.
source .envrc || _fatal 'Couldnt source this'
set -x
set -e # exists at first error
set -u # fails at first undefined VAR (!!)

########################
# Add your code here
########################

export PROJECT_NUMBER=$(gcloud projects describe $DEVSHELL_PROJECT_ID --format='value(projectNumber)')

gcloud secrets add-iam-policy-binding rails_secret \
  --member serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
  --role roles/secretmanager.secretAccessor

gcloud secrets add-iam-policy-binding rails_secret \
   --member serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
   --role roles/secretmanager.secretAccessor

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
    --member serviceAccount:$PROJECT_NUMBER@cloudbuild.gserviceaccount.com \
    --role roles/cloudsql.client


########################
# /End of your code here
########################
_after_allgood_post_script
echo '👍 Everything is ok. But Riccardo you should think about 🌍rewriting it in Terraform🌍'
