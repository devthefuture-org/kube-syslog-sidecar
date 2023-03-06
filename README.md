# kube-syslog-sidecar

Fork of [whereisaaron/docker-syslog-ng-sidecar](https://github.com/whereisaaron/kube-syslog-sidecar) to provide automated builds and minor tweaks.

Dockerfile for syslog-ng to run in a sidecar container logging to stdout. The purpose of this
Dockerfile is to build a Docker image that runs in a sidecar container, forwarding logs
from the main container to stdout so Kubernetes can pick up the logs.

One use of this is to make `haproxy` container friendly, by logging to stdout.


---

This fork was made, because the original image was not built for linux/arm64, causing problems in my Raspberry Pi K3s cluster running [haproxy-ingress](https://github.com/jcmoraisjr/haproxy-ingress) with sys-logs enabled.

The haproxy-ingress pod could not start because the log sidecar failed with ```syslog-ng: exec format error```

GitHub Actions will automatically build images for ```linux/arm64, linux/amd64, linux/arm/v7```. 

You can then use ```ghcr.io/crisu1710/kube-syslog-sidecar:main```
