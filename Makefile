GRAPH_NOTEBOOK_VERSION=3.0.6
REPO_NAME=samjackmartin/docker-graph-notebook
VERSION_TAG_NAME=$(REPO_NAME):$(GRAPH_NOTEBOOK_VERSION)
LATEST_TAG_NAME=$(REPO_NAME):latest

build-docker:
	cd docker-graph-notebook && docker build --build-arg GRAPH_NOTEBOOK_VERSION=$(GRAPH_NOTEBOOK_VERSION) -t $(VERSION_TAG_NAME) -t $(LATEST_TAG_NAME) .

push-docker:
	docker push $(VERSION_TAG_NAME)
	docker push $(LATEST_TAG_NAME)

build-and-push-docker: build-docker push-docker
