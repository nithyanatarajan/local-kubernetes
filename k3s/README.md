## K3s cluster with local registry

> Modify CLUSTER_NAME in .envrc if needed

### Create cluster

```bash
./create.sh
```

### Test Setup

```bash
export KUBECONFIG=$(k3d kubeconfig write ${CLUSTER_NAME})
kubectl cluster-info
kubectl apply -f ../example
kubectl get pod
```

### Delete cluster

```bash
./delete.sh
```
