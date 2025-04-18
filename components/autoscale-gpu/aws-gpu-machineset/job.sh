#!/bin/bash

# shellcheck disable=SC1091
. /scripts/ocp.sh

INSTANCE_TYPE=${INSTANCE_TYPE:-g4dn.4xlarge}

ocp_machineset_patch_accelerator(){
  MACHINE_SET_NAME=${1:-gpu}
  LABEL=${2:-nvidia-gpu}

  oc -n openshift-machine-api \
    patch machineset "${MACHINE_SET_NAME}" \
    --type=merge --patch '{"spec":{"template":{"spec":{"metadata":{"labels":{"cluster-api/accelerator":"'"${LABEL}"'"}}}}}}'
  
  oc -n openshift-machine-api \
    patch machineset "${MACHINE_SET_NAME}" \
    --type=merge --patch '{"spec":{"template":{"spec":{"metadata":{"labels":{"node-role.kubernetes.io/gpu":""}}}}}}'
}

ocp_aws_cluster || exit 0

ocp_aws_machineset_clone_worker g6.xlarge gpu-l4
ocp_aws_machineset_clone_worker g5.xlarge gpu-a10

ocp_aws_machineset_fix_storage machineset/gpu-l4 400
ocp_aws_machineset_fix_storage machineset/gpu-a10 400

ocp_machineset_patch_accelerator gpu-l4 nvidia-l4
ocp_machineset_patch_accelerator gpu-a10 nvidia-a10
