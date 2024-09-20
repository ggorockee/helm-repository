# gke-https-stack

이 차트는 gke에서 frontendconfig와 backendconfig를 사용하기 위해 제작함

```yaml
stack:
  - name: ggorockee
    sslPolicy: ggorockee
    acme:
      enable: true
      domain: dev.ggorockee.com
    frontendSpec:
      redirectToHttps:
        enabled: true
        responseCodeName: MOVED_PERMANENTLY_DEFAULT
    backendSpec:
      healthCheck:
      checkIntervalSec: 5 # probe의 interval
      timeoutSec: 5 # probe의 timeout
      healthyThreshold: 2 # 상태확인시 몇회 이상 정상이 되어야 하는지
      unhealthyThreshold: 5 # 상태확인시 몇회 이상 비정상이 되어야 하는지
      type: HTTP # HTTP, HTTPS, HTTP/2 중에서 선택
      requestPath: /status # url path 미설정시 / 이 기본값
      port: 8001 # 커스텀 포트일경우 설정, 미설정시 80 포트가 기본값
```

리스트 형태로 작성하며 frontendConfig와 BackendConfig의 `name`은 공유한다.  
sslPolicy는 gcp 따로 만들어야한다.

acme.enable이 true로 설정되어 있으면 해당 도메인으로 managed certificate를 만든다.


리스트 형태로 작성