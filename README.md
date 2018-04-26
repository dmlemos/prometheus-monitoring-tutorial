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
