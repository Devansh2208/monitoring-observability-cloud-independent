# Migration Guide

## Overview

This document describes the migration from the existing AWS-native observability platform to a cloud-agnostic open-source observability platform.

---

## Existing AWS Architecture

### Metrics

Application

→ CloudWatch Metrics

→ CloudWatch Dashboard

### Logs

Application

→ Fluent Bit

→ CloudWatch Logs

### Alerts

CloudWatch Metrics

→ CloudWatch Alarms

→ SNS

### Infrastructure Monitoring

CloudWatch Agent

→ Container Insights

---

## Target Open-Source Architecture

### Metrics

Application

→ ServiceMonitor

→ Prometheus

→ Grafana

### Logs

Application

→ Promtail

→ Loki

→ Grafana

### Alerts

Prometheus

→ Alertmanager

→ Slack / Email / Teams

### Infrastructure Monitoring

Node Exporter

→ Prometheus

kube-state-metrics

→ Prometheus

---

## Component Mapping

| AWS Component        | Open Source Replacement         |
| -------------------- | ------------------------------- |
| CloudWatch Metrics   | Prometheus                      |
| CloudWatch Dashboard | Grafana                         |
| CloudWatch Logs      | Loki                            |
| CloudWatch Alarms    | Alertmanager                    |
| Container Insights   | Prometheus + kube-state-metrics |
| CloudWatch Agent     | Node Exporter                   |
| Fluent Bit           | Promtail / Fluentd              |
| AWS X-Ray            | Tempo (Future)                  |

---

## Migration Steps

### Phase 1

Deploy:

* Prometheus
* Grafana
* Alertmanager
* kube-state-metrics

### Phase 2

Deploy:

* Loki
* Promtail

### Phase 3

Onboard Applications

* Metrics Endpoint
* ServiceMonitor
* Logging

### Phase 4

Configure Notifications

* Slack
* Email
* Teams

### Phase 5

Future Enhancements

* OpenTelemetry Collector
* Tempo
* Distributed Tracing

---

## Benefits

* No vendor lock-in
* Lower observability cost
* Kubernetes-native
* Multi-cloud support
* Standardized onboarding process
