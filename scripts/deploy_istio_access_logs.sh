#!/usr/bin/env bash

cat <<EOF > telemetry.yaml
---
apiVersion: telemetry.istio.io/v1alpha1
kind: Telemetry
metadata:
  name: mesh-default
  namespace: istio-system
spec:
  accessLogging:
    - providers:
      - name: envoy
      filter:
        expression: "response.code >= 400"
EOF

kubectl apply -f telemetry.yaml
