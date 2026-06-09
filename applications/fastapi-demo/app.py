from fastapi import FastAPI
from prometheus_client import Counter, Histogram, generate_latest
from fastapi.responses import Response
import time
import random
import logging

app = FastAPI()

logging.basicConfig(level=logging.INFO)

REQUEST_COUNT = Counter(
    "http_requests_total",
    "Total HTTP Requests"
)

REQUEST_LATENCY = Histogram(
    "http_request_duration_seconds",
    "Request latency"
)

@app.get("/")
def root():
    start = time.time()

    REQUEST_COUNT.inc()

    sleep_time = random.uniform(0.1, 0.5)
    time.sleep(sleep_time)

    REQUEST_LATENCY.observe(time.time() - start)

    logging.info("Root endpoint called")

    return {
        "message": "FastAPI Demo Running"
    }

@app.get("/health")
def health():
    return {
        "status": "healthy"
    }

@app.get("/metrics")
def metrics():
    return Response(
        generate_latest(),
        media_type="text/plain"
    )