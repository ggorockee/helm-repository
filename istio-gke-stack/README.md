# Istio Gateway Helm Chart

This chart installs an Istio gateway deployment.

## prerequisite
istio-version: `1.23`  
backend-config name is `istio-ingress`
```yaml
# change istio service

metadata:
  annotations:
    cloud.google.com/backend-config: '{"default": "istio-ingress"}'

```

## Setup Repo Info

```console
helm repo add ggorockee https://ggorockee.github.io/helm-repository/chart
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Installing the Chart

To install the chart with the release name `istio-gke-stack` with namespace `istio-system`:

```console
helm install istio-gke-stack ggorockee/istio-gke-stack --namespace istio-system --create-namespace
```

## Uninstalling the Chart

To uninstall/delete the `istio-gke-stack` deployment:

```console
helm delete istio-gke-stack --namespace istio-system
```

## Configuration

To view support configuration options and documentation, run:

```console
helm show values ggorockee/istio-gke-stack
```

### Examples

```yaml
projectId: "your_project_id"
ip_address:
  - name: your_IP_address
    domains:
      - "your.domain.com"

  - name: your_IP_address
    domains:
      - "your.domain.com"

ingress:
  backend:
    name: istio-ingress
    port: 80
    path: /
    pathType: Prefix

backendConfig:
  name: istio-ingress
  spec:
    healthCheck:
      checkIntervalSec: 5 # probe의 interval
      timeoutSec: 5 # probe의 timeout
      healthyThreshold: 2 # 상태확인시 몇회 이상 정상이 되어야 하는지
      unhealthyThreshold: 5 # 상태확인시 몇회 이상 비정상이 되어야 하는지
      type: HTTP # HTTP, HTTPS, HTTP/2 중에서 선택
      requestPath: /healthz/ready
      port: 15021 # 커스텀 포트일경우 설정, 미설정시 80 포트가 기본값

frontendConfig:
  name: istio-ingress
  spec:
    redirectToHttps:
      enabled: true
```