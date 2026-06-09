# Deployment Guide

## Prerequisites

Install:

* Docker Desktop
* Kubernetes (enabled in Docker Desktop)
* kubectl
* Helm

Verify:

```bash
kubectl get nodes
helm version
```

---

## Create Namespace

```bash
kubectl apply -f infrastructure/namespace/observability.yaml
```

Verify:

```bash
kubectl get ns
```

---

## Install Monitoring Stack

Install kube-prometheus-stack:

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
-n observability \
-f infrastructure/prometheus/values.yaml
```

Verify:

```bash
kubectl get pods -n observability
```

Expected components:

* Prometheus
* Grafana
* Alertmanager
* kube-state-metrics

---

## Access Grafana

```bash
kubectl port-forward svc/monitoring-grafana 3000:80 -n observability
```

Open:

```text
http://localhost:3000
```

Default Credentials:

```text
Username: admin
Password: admin123
```

---

## Install Logging Stack

Install Loki:

```bash
helm install loki-stack grafana/loki-stack \
-n observability \
-f infrastructure/loki/values.yaml
```

Verify:

```bash
kubectl get pods -n observability
```

Expected:

* loki-stack
* loki-stack-promtail

---

## Deploy Sample Application

```bash
kubectl apply -f applications/fastapi-demo/deployment.yaml
kubectl apply -f applications/fastapi-demo/service.yaml
kubectl apply -f applications/fastapi-demo/servicemonitor.yaml
```

Verify:

```bash
kubectl get pods -n observability
```

---

## Verify Metrics

Generate traffic:

```bash
curl http://localhost:8000
```

Prometheus Query:

```promql
http_requests_total
```

---

## Verify Logs

Grafana Explore:

```logql
{namespace="observability"}
```

Expected:

```text
INFO:root:Root endpoint called
```

---

## Verify Alerts

Apply:

```bash
kubectl apply -f infrastructure/prometheus/rules/fastapi-alerts.yaml
```

Open:

```text
http://localhost:9090/alerts
```

Verify alert state:

```text
FIRING
```

---

## Deployment Complete

The platform is ready for:

* Metrics
* Logging
* Alerting
* Application onboarding
