# Cloud-Agnostic Open Source Observability Platform

## Overview

This project provides a Kubernetes-native, cloud-agnostic observability platform built entirely using open-source technologies.

The platform was designed to replace AWS-native observability services such as CloudWatch Logs, CloudWatch Metrics, CloudWatch Dashboards, Container Insights, and CloudWatch Alarms with a portable solution that can run on any Kubernetes environment.

Supported platforms include:

* AWS EKS
* Azure AKS
* Google GKE
* OpenShift
* Rancher
* K3s
* On-Prem Kubernetes
* Bare Metal Kubernetes

The platform follows a standardized onboarding model allowing product teams to integrate monitoring, logging, and alerting with minimal effort.

---

## Problem Statement

Traditional cloud-native observability solutions often create vendor lock-in and recurring operational costs.

The previous architecture relied heavily on AWS-managed services:

* CloudWatch Logs
* CloudWatch Metrics
* Container Insights
* CloudWatch Dashboards
* CloudWatch Alarms
* Fluent Bit
* CloudWatch Agent

This project replaces those services with a fully open-source observability stack.

---

## Solution Architecture

### Metrics

FastAPI Application

↓

ServiceMonitor

↓

Prometheus

↓

Grafana

---

### Logging

FastAPI Application

↓

Promtail

↓

Loki

↓

Grafana

---

### Alerting

Prometheus

↓

PrometheusRule

↓

Alertmanager

↓

Slack / Teams / Email

---

### Future Distributed Tracing

FastAPI Application

↓

OpenTelemetry Collector

↓

Tempo

↓

Grafana

---

## Components

| Component               | Purpose                             |
| ----------------------- | ----------------------------------- |
| Prometheus              | Metrics collection and storage      |
| Grafana                 | Visualization and dashboards        |
| Loki                    | Log aggregation and storage         |
| Promtail                | Log collection                      |
| Alertmanager            | Alert routing and notifications     |
| kube-state-metrics      | Kubernetes object metrics           |
| Node Exporter           | Infrastructure metrics (production) |
| OpenTelemetry Collector | Unified telemetry pipeline (future) |
| Tempo                   | Distributed tracing (future)        |

---

## Features

### Monitoring

* Application metrics
* Kubernetes metrics
* Service health monitoring
* Custom Prometheus metrics

### Logging

* Centralized log aggregation
* Log search
* Log filtering
* Namespace-based log queries

### Alerting

* Prometheus alert rules
* Alertmanager integration
* Slack notifications
* Email notifications
* Microsoft Teams notifications

### Platform Operations

* Standardized onboarding
* Kubernetes-native deployment
* Cloud-agnostic architecture
* Open-source only

---

## Repository Structure

observability-platform/

├── README.md

├── docs/

├── architecture/

├── infrastructure/

├── applications/

├── scripts/

└── environments/

---

## Deployment Overview

1. Create Kubernetes namespace
2. Install kube-prometheus-stack
3. Install Loki
4. Deploy application
5. Configure ServiceMonitor
6. Verify metrics
7. Verify logs
8. Configure alerts

Detailed deployment instructions are available in:

docs/Deployment-Guide.md

---

## Product Onboarding Workflow

Product Team Provides:

* Source Code
* Dockerfile
* Health Endpoint
* Metrics Endpoint
* Resource Requirements

Observability Team Provides:

* Monitoring
* Logging
* Dashboards
* Alerts
* Grafana Access

Detailed onboarding instructions are available in:

docs/Product-Onboarding.md

---

## Demonstrated Capabilities

### Metrics

FastAPI

→ Prometheus

→ Grafana

### Logs

FastAPI

→ Promtail

→ Loki

→ Grafana

### Alerts

Prometheus Rule

→ Alertmanager

### Kubernetes Monitoring

kube-state-metrics

→ Prometheus

→ Grafana

---

## Future Roadmap

### Phase 1

Completed

* Prometheus
* Grafana
* Loki
* Promtail
* Alertmanager
* FastAPI Demo Service

### Phase 2

Planned

* Slack Integration
* Email Integration
* Microsoft Teams Integration

### Phase 3

Planned

* OpenTelemetry Collector
* Tempo
* Distributed Tracing

### Phase 4

Planned

* ArgoCD
* GitOps Deployment
* Velero Backup
* Disaster Recovery

---

## Business Benefits

* Eliminate cloud vendor lock-in
* Reduce observability costs
* Standardize application onboarding
* Improve platform portability
* Enable centralized monitoring
* Support multi-cloud deployments

---

## Authors

Platform Engineering Team

Observability Platform Initiative
