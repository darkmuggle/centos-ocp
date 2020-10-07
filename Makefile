oc_cmd := $(shell which oc4 2> /dev/null || which oc)
yaml := cosa-dev.yaml
oc_apply = $(oc_cmd) process -f $(yaml) | $(oc_cmd) apply -f -

.PHONY: apply
apply:
	$(oc_apply)
.PHONY: image
image: yaml = cosa-image.yaml
image: apply

.PHONY: dev
dev: yaml = cosa-dev.yaml
dev: apply

.PHONY: podder
podder: yaml = cosa-pod.yaml
podder: apply

.PHONY: podder3
podder3: oc_cmd = $(shell which oc)
podder3: yaml = cosa-pod-3.11.yaml
podder3: apply
