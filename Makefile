oc_cmd := $(shell which oc4 2> /dev/null || which oc)

.PHONY: apply
apply:
	$(oc_cmd) process -f cosa-dev.yaml | $(oc_cmd) apply -f -

.PHONY: podder
podder:
	$(oc_cmd) process -f cosa-pod.yaml | $(oc_cmd) apply -f -
