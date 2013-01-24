all:
	git submodule update --init --recursive

test:
	(cd $@ && make)

.PHONY: test
