# Demo OpenShift autoscaling with gpu machine sets

Show how to autoscale GPU resources in AWS using an OpenShift MachineSet

```sh
until oc apply -k components; do : ; done
```

```sh
oc -n openshift-machine-api \
  describe cm cluster-autoscaler-status
```
