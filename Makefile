export CGO_ENABLED:=0

VERSION=$(shell git describe --dirty)
LD_FLAGS="-w -X github.com/coreos/container-linux-config-transpiler/version.Raw=$(VERSION)"

REPO=github.com/coreos/container-linux-config-transpiler

all: build

build: bin/ct

bin/ct:
	@go build -o $@ -v -ldflags $(LD_FLAGS) $(REPO)/internal

test:
	@./test

clean:
	@rm -rf bin

.PHONY: all build clean test
