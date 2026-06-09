# Product Onboarding Guide

## Overview

This document describes the standard onboarding process for integrating applications with the Observability Platform.

---

## Product Team Responsibilities

The product team must provide:

### Application Source Code

Application repository containing:

* Business logic
* Configuration
* Build artifacts

### Dockerfile

Application must be containerized and deployable to Kubernetes.

### Health Endpoint

Example:

```http
GET /health
```

Response:

```json
{
  "status": "healthy"
}
```

### Metrics Endpoint

Example:

```http
GET /metrics
```

Metrics must be exposed in Prometheus format.

### Resource Requirements

Example:

```yaml
requests:
  cpu: 200m
  memory: 256Mi

limits:
  cpu: 500m
  memory: 512Mi
```

### Environment Variables

All required variables must be documented.

---

## Observability Team Responsibilities

The platform team provides:

* ServiceMonitor
* Prometheus integration
* Log collection
* Grafana dashboards
* Alert rules
* Alertmanager integration

---

## Onboarding Workflow

### Step 1

Deploy application to Kubernetes.

### Step 2

Create Kubernetes Service.

### Step 3

Create ServiceMonitor.

### Step 4

Verify Prometheus target status.

### Step 5

Verify logs in Grafana.

### Step 6

Configure alerts.

---

## Verification Checklist

### Metrics

* Application reachable
* Metrics endpoint available
* Target visible in Prometheus
* Metrics visible in Grafana

### Logs

* Logs generated
* Logs visible in Loki
* Logs searchable in Grafana

### Alerts

* Alert rules deployed
* Alerts visible in Alertmanager

---

## Example Application

Current reference implementation:

* FastAPI Demo Application
* Prometheus Metrics
* Loki Logging
* Alertmanager Integration

This application serves as the onboarding template for future services.
