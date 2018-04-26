expensive-metrics := 'topk(20, count by (__name__, job)({__name__=~".+"}))'

.PHONY: tips
tips:
	@echo 'Usage'
	@echo '  make tip-<name>'
	@echo
	@echo 'List of available tips:'
	@egrep '\s+:=\s+' tips.mk | cut -d ' ' -f -1

.PHONY: tip-%
tip-%:
	@echo $($(*))
