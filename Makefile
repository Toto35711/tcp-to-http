.PHONY: all build run test lint fmt tidy clean help

BINARY_NAME = tcp-to-http
BUILD_DIR = ./bin

GO = go
GOTEST = $(GO) test -v
GOBUILD = $(GO) build -o $(BUILD_DIR)/$(BINARY_NAME)
GOLINT = golangci-lint run
GOTIDY = $(GO) mod tidy

all: build

build:
	@mkdir -p $(BUILD_DIR)
	$(GOBUILD) ./cmd/server

run: build
	$(BUILD_DIR)/$(BINARY_NAME)

test:
	$(GOTEST) ./...

lint:
	$(GOLINT)

fmt:
	$(GO) fmt ./...

tidy:
	$(GOTIDY)

clean:
	rm -rf $(BUILD_DIR)

help:
	@echo "Usage: make [target]"
	@echo "Targets:"
	@echo "  build     - Build the binary"
	@echo "  run       - Run the server"
	@echo "  test      - Run tests"
	@echo "  lint      - Run linter"
	@echo "  fmt       - Format the code"
	@echo "  tidy      - Clean up dependencies"
	@echo "  clean     - Remove built binaries"
