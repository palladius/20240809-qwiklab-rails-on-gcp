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

set -euo pipefail
########################
# Add your code here
########################
BUCKET_NAME=$DEVSHELL_PROJECT_ID-ruby

proceed_if_error_matches 'already exists' \
    gsutil mb -l europe-west4 gs://$BUCKET_NAME

gsutil iam ch allUsers:objectViewer gs://$BUCKET_NAME


########################
# /End of your code here
########################
_after_allgood_post_script
echo '👍 Everything is ok. But Riccardo you should think about 🌍rewriting it in Terraform🌍'
