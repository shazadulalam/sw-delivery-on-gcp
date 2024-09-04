#!/bin/bash
echo "Building image for 1st release"
echo
###
skaffold build --default-repo=us-central1-docker.pkg.dev/gcp-learn-430710/cicd-test --file-output=artifacts.json
###
echo "Creating 1st release"
echo
gcloud deploy releases create first-release --delivery-pipeline cd-on-gcp-pipeline --region us-central1 --build-artifacts artifacts.json
###
echo "Release creation completed, please promote and approve your release manually"
