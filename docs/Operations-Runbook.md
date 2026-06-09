# Operations Runbook

## Overview

This runbook provides common operational procedures and troubleshooting steps for the Observability Platform.

---

## Check Platform Health

Verify all platform components:

```bash
kubectl get pods -n observability
```

Expected:

* Prometheus
* Grafana
* Alertmanager
* Loki
* Promtail
* kube-state-metrics

All should be in `Running` state.

---

## Grafana Not Accessible

Check Grafana pod:

```bash
kubectl get pods -n observability | grep grafana
```

Check logs:

```bash
kubectl logs deployment/monitoring-grafana -n observability
```

Restart deployment:

```bash
kubectl rollout restart deployment monitoring-grafana -n observability
```

---

## Prometheus Target Not Scraping

Verify ServiceMonitor:

```bash
kubectl get servicemonitor -A
```

Check targets:

```bash
kubectl port-forward svc/monitoring-kube-prometheus-prometheus 9090:9090 -n observability
```

Open:

```text
http://localhost:9090/targets
```

---

## Metrics Missing in Grafana

Verify:

```bash
kubectl get servicemonitor -A
```

Check Prometheus query:

```promql
http_requests_total
```

If metric is visible in Prometheus but not Grafana, verify datasource health.

---

## Logs Not Appearing in Grafana

Check Loki:

```bash
kubectl get pods -n observability | grep loki
```

Check Promtail:

```bash
kubectl get pods -n observability | grep promtail
```

Check application logs:

```bash
kubectl logs deployment/fastapi-demo -n observability
```

---

## Alert Not Firing

Verify PrometheusRule:

```bash
kubectl get prometheusrule -n observability
```

Check Prometheus alerts:

```text
http://localhost:9090/alerts
```

Verify Alertmanager:

```text
http://localhost:9093
```

---

## Pod Restarting Frequently

Check pod status:

```bash
kubectl describe pod <pod-name> -n observability
```

Check logs:

```bash
kubectl logs <pod-name> -n observability
```

---

## Useful Commands

List resources:

```bash
kubectl get all -n observability
```

View events:

```bash
kubectl get events -n observability
```

Delete application:

```bash
kubectl delete deployment fastapi-demo -n observability
```

Restart deployment:

```bash
kubectl rollout restart deployment fastapi-demo -n observability
```

---

## Escalation Path

1. Verify Kubernetes resources
2. Check pod logs
3. Check Prometheus targets
4. Check Loki ingestion
5. Check Alertmanager status
6. Review Grafana dashboards

Following this sequence resolves most platform issues quickly.
