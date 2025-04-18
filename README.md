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
