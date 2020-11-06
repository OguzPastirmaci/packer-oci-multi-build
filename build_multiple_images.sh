#!/bin/bash

set -e

# Build the first image in parallel in IAD and PHX regions. This will install Docker on Oracle Linux 7.8 and build the image.
packer build --var-file variables.json install_docker_and_build_image.json  | tee packer.log

# Get the image IDs from the previous Packer build to be used as base images in the second step
IAD_IMAGE_ID=$(grep "ocid1.image.oc1.iad" packer.log | awk '{print $9}' | sed 's/.$//')
PHX_IMAGE_ID=$(grep "ocid1.image.oc1.phx" packer.log | awk '{print $9}' | sed 's/.$//')

# Use the image IDs from the first step as the base image for the second step of image build. This will take the Oracle Linux 7.8 image that has Docker installed, pulls the container image and then creates a new image.
packer build -var "iad_base_image_id_from_first_step=$IAD_IMAGE_ID" -var "phx_base_image_id_from_first_step=$PHX_IMAGE_ID"  --var-file variables.json pull_container_and_build_image.json

# Remove the log file
rm packer.log
