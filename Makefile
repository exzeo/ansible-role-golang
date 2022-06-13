tests  := $(wildcard molecule/*)
scenarios := $(tests)

lint:
	yamllint . 
	ansible-lint . 

test: lint
	make all

.PHONY: all
all: $(scenarios)

.PHONY: $(tests)
$(tests): 
	molecule test --parallel -s $(notdir $@)