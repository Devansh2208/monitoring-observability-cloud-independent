#!/bin/bash

set -e

echo "======================================="
echo "Creating Observability Namespace"
echo "======================================="

kubectl apply -f infrastructure/namespace/observability.yaml

echo "======================================="
echo "Adding Helm Repositories"
echo "======================================="

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

helm repo update

echo "======================================="
echo "Installing Prometheus Stack"
echo "======================================="

helm install monitoring prometheus-community/kube-prometheus-stack \
-n observability \
-f infrastructure/prometheus/values.yaml

echo "======================================="
echo "Installing Loki"
echo "======================================="

helm install loki-stack grafana/loki-stack \
-n observability \
-f infrastructure/loki/values.yaml

echo "======================================="
echo "Deploying FastAPI Demo"
echo "======================================="

kubectl apply -f applications/fastapi-demo/deployment.yaml
kubectl apply -f applications/fastapi-demo/service.yaml
kubectl apply -f applications/fastapi-demo/servicemonitor.yaml

echo "======================================="
echo "Deploying Alert Rules"
echo "======================================="

kubectl apply -f infrastructure/prometheus/rules/fastapi-alerts.yaml

echo "======================================="
echo "Installation Complete"
echo "======================================="

echo "Grafana:"
echo "kubectl port-forward svc/monitoring-grafana 3000:80 -n observability"

echo "Prometheus:"
echo "kubectl port-forward svc/monitoring-kube-prometheus-prometheus 9090:9090 -n observability"

echo "Alertmanager:"
echo "kubectl port-forward svc/monitoring-kube-prometheus-alertmanager 9093:9093 -n observability"