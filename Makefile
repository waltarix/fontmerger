SOURCE_DIR := src
DIST_DIR := dist

FONT_CONFIG := $(SOURCE_DIR)/fonts.json

FONTMERGER := ./bin/fontmerger
FONTMERGER_SUFFIX ?= with-icons
FONTMERGER_OPTION := --all -c "$(FONT_CONFIG)" -o "$(DIST_DIR)" --suffix="$(FONTMERGER_SUFFIX)"

BASE_FONT := $(SOURCE_DIR)/base/FiraCode-Regular.ttf
MERGED_FONT := $(DIST_DIR)/FiraCode-$(FONTMERGER_SUFFIX)-Regular.ttf

DOCKER_TAG := fontmerger:latest

all: $(MERGED_FONT)

font:
	docker build -t $(DOCKER_TAG) docker
	docker run --rm -i -t -e DK_UID=$(shell id -u) -e DK_GID=$(shell id -g) -v $(PWD):/fontmerger $(DOCKER_TAG) make

$(MERGED_FONT): $(BASE_FONT) $(DIST_DIR)
	$(FONTMERGER) $(FONTMERGER_OPTION) $<

$(BASE_FONT):
	peru sync

$(DIST_DIR):
	mkdir -p $@

clean:
	peru clean
	$(RM) -rf $(DIST_DIR)

.PHONY: all font clean
