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
gcloud --project $PROJECT_ID run deploy $APP_NAME \
     --platform managed \
     --region $REGION \
     --image "gcr.io/$DEVSHELL_PROJECT_ID/$APP_NAME" \
     --add-cloudsql-instances $DEVSHELL_PROJECT_ID:$REGION:$INSTANCE_NAME \
     --allow-unauthenticated \
     --max-instances=3








########################
# /End of your code here
########################
_after_allgood_post_script
echo '👍 Everything is ok. But Riccardo you should think about 🌍rewriting it in Terraform🌍'
