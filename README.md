# Demo OpenShift autoscaling with gpu machine sets

Show how to autoscale GPU resources on OpenShift in AWS using the following...

Objects:

- `MachineSet`
- `MachineSetAutoScaler`
- `ClusterAutoscaler`

Operators:

- [Node Feature Discovery Operator (NFD)](components/operators/nfd)
- [NVIDIA GPU Operator](components/operators/nvidia-gpu)

## Prerequisites - Get a cluster

- OpenShift 4.16+
  - role: `cluster-admin`

[Red Hat Demo Platform](https://demo.redhat.com) - Options (Tested) Below

NOTE: The node sizes below are the **recommended minimum** to select for provisioning

- <a href="https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.sandbox-ocp.prod&utm_source=webapp&utm_medium=share-link" target="_blank">AWS with OpenShift Open Environment</a>
  - 1 x Control Plane - `m6a.2xlarge`
  - 0 x Workers - `m6a.2xlarge`
- <a href="https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.ocp4-single-node.prod&utm_source=webapp&utm_medium=share-link" target="_blank">One Node OpenShift</a>
  - 1 x Control Plane - `m6a.2xlarge`
- <a href="https://catalog.demo.redhat.com/catalog?item=babylon-catalog-prod/openshift-cnv.ocp4-cnv-gitops.prod&utm_source=webapp&utm_medium=share-link" target="_blank">OpenShift GitOps Blank Environment</a>
  - 1 x Control Plane - `16 cores`, `64Gi`

## Getting Started

### Install the [OpenShift Web Terminal](https://docs.openshift.com/container-platform/4.12/web_console/web_terminal/installing-web-terminal.html)

The following icon should appear in the top right of the OpenShift web console after you have installed the operator. Clicking this icon launches the web terminal.

![Web Terminal](docs/images/web-terminal.png "Web Terminal")

NOTE: Reload the page in your browser if you do not see the icon after installing the operator.

## Make the enhanced web terminal permanent

```sh
# apply the enhanced web terminal
oc apply -k https://github.com/redhat-na-ssa/demo-ocp-autoscale-gpu/demo/web-terminal

# delete old web terminal
$(wtoctl | grep 'oc delete')
```

NOTE: The following commands are available in an enhanced web terminal.

## Quickstart

Run directly from remote

```sh
until oc apply -k https://github.com/redhat-na-ssa/demo-ocp-autoscale-gpu/demo; do : ; done
```

Query the status of the cluster autoscaler

```sh
oc -n openshift-machine-api \
  describe cm cluster-autoscaler-status
```

## Uninstall

```sh
oc delete -k demo/uninstall
```

Reset the web terminal

```sh
oc apply -k components/operators/web-terminal/reset-default
```

## Known Issues

NOTE: If you have manually installed operators through the OpenShift web console before running this automation there may be duplicate operator groups.

Manually Remove any duplicate operator groups ending in `-xxxxx` or use the following command in the enhanced web terminal.

```sh
ocp_fix_duplicate_operator_groups
```

## Manual Steps

[Manual steps for configuring a machineset for GPUs](components/gpu-autoscale/README.md)

## Links

- [OpenShift Docs - Autoscaling](https://docs.redhat.com/en/documentation/openshift_container_platform/4.18/html/machine_management/applying-autoscaling)
