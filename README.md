# local-kubernetes

## Setup Local environment variables

1. Install [direnv](https://github.com/direnv/direnv)
2. Copy `.envrc.sample` to `.envrc`
3. Run `direnv allow .`

## Setup local registry

```bash
./create-registry.sh
```

## Test setup with local registry

```bash
docker pull nginx:latest
docker tag nginx:latest localhost:"${REG_PORT}"/nginx:latest
docker push localhost:"${REG_PORT}"/nginx:latest
```

```bash
curl -s localhost:"${REG_PORT}"/v2/_catalog | jq
```