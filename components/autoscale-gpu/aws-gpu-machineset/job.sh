#!/bin/bash

# shellcheck disable=SC1091
. /scripts/ocp.sh

ocp_aws_cluster || exit 0

ocp_aws_machineset_clone_worker g6.xlarge gpu-l4
ocp_aws_machineset_clone_worker g5.xlarge gpu-a10

ocp_aws_machineset_fix_storage machineset/gpu-l4 400
ocp_aws_machineset_fix_storage machineset/gpu-a10 400

ocp_machineset_patch_accelerator gpu-l4 nvidia-l4
ocp_machineset_patch_accelerator gpu-a10 nvidia-a10

ocp_machineset_taint_gpu gpu-l4
ocp_machineset_taint_gpu gpu-a10

# unlabeled machine set
ocp_aws_machineset_clone_worker g4dn.xlarge gpu-keda
ocp_machineset_taint_gpu gpu-keda
