# Description

Deploy a Prometheus + Grafana stack using docker-compose.
This is mostly to understand how all the components work. Do not use in production!

## Requirements

* [docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)

## Installation

Clone the project.

```bash
make stackup
```

You now have a full stack running. \
`Prometheus` is serving on port `9090` \
`node-exporter` is serving on port `9100`

## Tips

Included is a few Prometheus tips that help you on the learning journey.
To get a list of tips, execute:
```bash
make tips
```

These are a list of queries that may prove useful.

## See It In Action

### Example 1 - Drop expensive metrics

To get a list of expensive metrics, use this tip on your Prometheus PromQL:
```bash
make tip-expensive-metrics
```

Then to drop the expensive metric onto the prometheus config:
```bash
make drop-expensive-metric metric=<metric name>
```

Reload prometheus:
```bash
make reload-prometheus
```
