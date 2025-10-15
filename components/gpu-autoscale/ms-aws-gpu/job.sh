#!/bin/bash

# shellcheck disable=SC1091
. /scripts/functions.sh

# clean cluster pods
ocp_pods_delete_failed

# check for aws cluster
ocp_aws_cluster || exit 0

# setup machine set
ocp_aws_machineset_clone_worker g6.xlarge gpu-l4
ocp_aws_machineset_clone_worker g5.xlarge gpu-a10

# give machineset more storage
ocp_aws_machineset_fix_storage machineset/gpu-l4 250
ocp_aws_machineset_fix_storage machineset/gpu-a10 250

# add accelerator label
ocp_machineset_patch_accelerator gpu-l4 nvidia-l4
ocp_machineset_patch_accelerator gpu-a10 nvidia-a10

# add nvidia gpu taint
ocp_machineset_taint_gpu gpu-l4
ocp_machineset_taint_gpu gpu-a10
