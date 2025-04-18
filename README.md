# Demo OpenShift autoscaling with gpu machine sets

Show how to autoscale GPU resources in AWS using an OpenShift MachineSet

## Prerequisites

- OpenShift 4.16+ in AWS

```sh
until oc apply -k components; do : ; done
```

```sh
until oc apply -k https://github.com/redhat-na-ssa/demo-ocp-autoscale-gpu/components; do : ; done
```

```sh
oc -n openshift-machine-api \
  describe cm cluster-autoscaler-status
```

### Tools

The following cli tools are required:

- `bash`, `git`
- `oc` - Download [mac](https://formulae.brew.sh/formula/openshift-cli), [linux](https://mirror.openshift.com/pub/openshift-v4/clients/ocp), [windows](https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-windows.zip)
- `kubectl` (optional) - Included in `oc` bundle
- `kustomize` (optional) - Download [mac](https://formulae.brew.sh/formula/kustomize), [linux](https://github.com/kubernetes-sigs/kustomize/releases)

NOTE: `bash`, `git`, and `oc` are available in the [OpenShift Web Terminal](https://docs.openshift.com/container-platform/4.12/web_console/web_terminal/installing-web-terminal.html)
