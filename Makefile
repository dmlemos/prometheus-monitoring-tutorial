TOP_DIR  := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
TOP_SELF := $(notdir $(patsubst %/,%,$(abspath $(TOP_DIR))))

PROMETHEUS_CONFIG := $(TOP_DIR)/prometheus/prometheus.yml
TEMPLATES_DIR     := $(TOP_DIR)/templates
DOCKER_PROJECT    := $(TOP_SELF)

# ---------------
# Stack controls
# ---------------

.PHONY: stackup
stackup: render-prometheus-config
	@docker-compose -p $(DOCKER_PROJECT) up

.PHONY: reload-%
reload-%:
	@docker kill -s SIGHUP $(TOP_SELF)_$*

.PHONY: reload-prometheus
reload-prometheus: reload-prometheus_1

# ------------------
# Prometheus config
# ------------------

define render_circuit
circuits=$@ $(MAKE) render-prometheus-config
endef

ifdef circuits
circuits := $(subst -,_,$(circuits))
circuits := $(foreach var,$(circuits),$(var)=true)
endif

.PHONY: render-prometheus-config
render-prometheus-config:
	@erb -T - $(circuits) $(metrics) $(PROMETHEUS_CONFIG).erb > $(PROMETHEUS_CONFIG)

show-prometheus-config:
	@cat $(PROMETHEUS_CONFIG)

.PHONY: drop-expensive-metric
drop-expensive-metric:
	@$(render_circuit) metrics="expensive_metric=$(metric)"

.PHONY: drop-go-stacktrace
drop-go-stacktrace:
	@$(render_circuit)

#------
# Tips
# -----
include tips.mk
