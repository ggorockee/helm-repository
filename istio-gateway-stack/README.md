# Istio Gateway Helm Chart

This chart installs an Istio gateway deployment.

## prerequisite
istio-version: `1.23`

## Setup Repo Info

```console
helm repo add ggorockee https://ggorockee.github.io/helm-repository/chart
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `istio-gateway-stack` with namespace `istio-system`:

```console
helm install istio-gateway-stack ggorockee/istio-gateway-stack --namespace istio-system --create-namespace
```

## Uninstalling the Chart

To uninstall/delete the `istio-gateway-stack` deployment:

```console
helm delete istio-gateway-stack --namespace istio-system
```

## Configuration

To view support configuration options and documentation, run:

```console
helm show values ggorockee/istio-gateway-stack
```

### Examples

```yaml
gatewayset:
  - name: bookinfo-gateway
    hosts:
      - "*"

    # gateway
    servers:
      - port:
          number: 8080
          name: http
          protocol: HTTP

    # virtualservice
    http:
      service: productpage
      port:
        number: 9080
      match:
        - uri:
            exact: /productpage
        - uri:
            prefix: /static
        - uri:
            exact: /login
        - uri:
            exact: /logout
        - uri:
            prefix: /api/v1/products
```

### Release
* 1.0.2:  
  * added namespace
