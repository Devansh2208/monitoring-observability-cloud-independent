#!/bin/bash

set -e

echo "======================================="
echo "Removing FastAPI Demo"
echo "======================================="

kubectl delete -f applications/fastapi-demo/servicemonitor.yaml --ignore-not-found=true
kubectl delete -f applications/fastapi-demo/service.yaml --ignore-not-found=true
kubectl delete -f applications/fastapi-demo/deployment.yaml --ignore-not-found=true

echo "======================================="
echo "Removing Alert Rules"
echo "======================================="

kubectl delete -f infrastructure/prometheus/rules/fastapi-alerts.yaml --ignore-not-found=true

echo "======================================="
echo "Uninstalling Loki"
echo "======================================="

helm uninstall loki-stack -n observability || true

echo "======================================="
echo "Uninstalling Prometheus Stack"
echo "======================================="

helm uninstall monitoring -n observability || true

echo "======================================="
echo "Deleting Namespace"
echo "======================================="

kubectl delete namespace observability --ignore-not-found=true

echo "======================================="
echo "Uninstallation Complete"
echo "======================================="