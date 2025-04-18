# Demo OpenShift autoscaling with gpu machine sets

Show how to autoscale GPU resources in AWS using an OpenShift MachineSet

## Quickstart

NOTE: If you have manually installed operators through the OpenShift web console before running this automation you may have duplicate operator groups.
Remove any duplicate operator groups ending in `-xxxxx`

Run directly from remote

```sh
until oc apply -k https://github.com/redhat-na-ssa/demo-ocp-autoscale-gpu/components; do : ; done
```

Run with a git repo cloned locally (alternative)

```sh
until oc apply -k components; do : ; done
```

Query the status of the cluster autoscaler

```sh
oc -n openshift-machine-api \
  describe cm cluster-autoscaler-status
```

## Prerequisites - Get a cluster

- OpenShift 4.16+
  - role: `cluster-admin`

[Red Hat Demo Platform](https://demo.redhat.com) Options (Tested)

NOTE: The node sizes below are the **recommended minimum** to select for provisioning

- <a href="https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.sandbox-ocp.prod&utm_source=webapp&utm_medium=share-link" target="_blank">AWS with OpenShift Open Environment</a>
  - 1 x Control Plane - `m6a.2xlarge`
  - 0 x Workers - `m6a.2xlarge`
- <a href="https://demo.redhat.com/catalog?item=babylon-catalog-prod/sandboxes-gpte.ocp4-single-node.prod&utm_source=webapp&utm_medium=share-link" target="_blank">One Node OpenShift</a>
  - 1 x Control Plane - `m6a.2xlarge`
- <a href="https://demo.redhat.com/catalog?item=babylon-catalog-prod/community-content.com-mlops-wksp.prod&utm_source=webapp&utm_medium=share-link" target="_blank">MLOps Demo: Data Science & Edge Practice</a>

### Tools

The following cli tools are required:

- `bash`, `git`
- `oc` - Download [mac](https://formulae.brew.sh/formula/openshift-cli), [linux](https://mirror.openshift.com/pub/openshift-v4/clients/ocp), [windows](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-windows.zip)
- `kubectl` (optional) - Included in `oc` bundle
- `kustomize` (optional) - Download [mac](https://formulae.brew.sh/formula/kustomize), [linux](https://github.com/kubernetes-sigs/kustomize/releases)

NOTE: `bash`, `git`, and `oc` are available in the [OpenShift Web Terminal](https://docs.openshift.com/container-platform/4.12/web_console/web_terminal/installing-web-terminal.html)

## Manual Steps

[Manual steps for configuring a machineset for GPUs](components/autoscale-gpu/README.md)
