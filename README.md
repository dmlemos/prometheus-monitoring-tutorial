# Description

Deploy a Prometheus + Grafana stack using docker-compose.

This is an interactive tutorial to understand how all the components work. Do not use in production!

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

**Note: Prometheus is set to scrape every second for faster feedback. If you notice performance degradation, you can change it to an higher value.**

## Tips

Included is a few Prometheus tips that help you on the learning journey.
To get a list of tips, execute:
```bash
make tips
```

These are a list of queries that may prove useful.

## See It In Action

Any time you want to go back to the default configuration, just run:
```bash
make render-prometheus-config
```

It is assumed that after you modify the Prometheus configuration you reload it to see the effects:

Reload after every change:
```bash
make reload-prometheus
```

### Example 1 - Drop expensive metrics

To get a list of expensive metrics, use this tip on your Prometheus PromQL:
```bash
make tip-expensive-metrics
```

Then to drop the expensive metric onto the prometheus config:
```bash
make drop-expensive-metric metric=<metric name>
```

### Example 1.1 - Drop all go stack traces

Eliminate all go stack traces:
```bash
make drop-go-stacktrace
```
