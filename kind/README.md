## Kind cluster with local registry

### Setup

1. Copy `.envrc.sample` to `.envrc`
2. Run `direnv allow .`

### Create cluster

> By default registry is configured connect to kind network on creation
> This is needed only first time
> To avoid connecting registry set CONNECT_ON_CREATE to false in .envrc

```bash
./create.sh
```

### Test Setup

```bash
export KUBECONFIG=$HOME/.kube/configs/${CLUSTER_NAME}.conf
kubectl cluster-info
kubectl apply -f ../example
kubectl get pod
```

### Delete cluster

> By default registry is configured to disconnect from kind network on deletion of a cluster
> This is not needed when there are many clusters
> To avoid disconnecting registry on delete set DISCONNECT_ON_DELETE to false in .envrc

```bash
./delete.sh
```