TOP_SELF := $(subst -,,$(notdir $(patsubst %/,%,$(abspath $(TOP_DIR)))))

.PHONY: stackup
stackup: render-prometheus-config
	@docker-compose up

.PHONY: reload-%
reload-%:
	@docker kill -s SIGHUP $(TOP_SELF)_$*

.PHONY: reload-prometheus
reload-prometheus: reload-prometheus_1
