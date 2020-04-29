# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOINSTALL=$(GOCMD) install
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
GOMOD=$(GOCMD) mod

.PHONY: all test coverage
all: test coverage

get:
	$(GOGET) ./...

test: get
	$(GOTEST) -race -covermode=atomic ./...

coverage: get
	$(GOTEST) -race -coverprofile=coverage.txt -covermode=atomic github.com/RedisAI/redisai-go/redisai

