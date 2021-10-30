GRAPH_NOTEBOOK_VERSION=3.0.7
GREMLIN_VERSION=3.5

build-docker-graph-notebook:
	$(eval REPO_NAME=samjackmartin/docker-graph-notebook)
	$(eval VERSION_TAG_NAME=$(REPO_NAME):$(GRAPH_NOTEBOOK_VERSION))
	$(eval LATEST_TAG_NAME=$(REPO_NAME):latest)

	cd docker-graph-notebook && docker build --build-arg GRAPH_NOTEBOOK_VERSION=$(GRAPH_NOTEBOOK_VERSION) -t $(VERSION_TAG_NAME) -t $(LATEST_TAG_NAME) .

push-docker-graph-notebook:
	$(eval REPO_NAME=samjackmartin/docker-graph-notebook)
	$(eval VERSION_TAG_NAME=$(REPO_NAME):$(GRAPH_NOTEBOOK_VERSION))
	$(eval LATEST_TAG_NAME=$(REPO_NAME):latest)
	docker push $(VERSION_TAG_NAME)
	docker push $(LATEST_TAG_NAME)

build-docker-graph-notebook-gremlin-server:
	$(eval REPO_NAME=samjackmartin/docker-graph-notebook-gremlin-server)
	$(eval VERSION_TAG_NAME=$(REPO_NAME):$(GREMLIN_VERSION))
	$(eval LATEST_TAG_NAME=$(REPO_NAME):latest)

	cd docker-graph-notebook-gremlin-server && docker build --build-arg GREMLIN_VERSION=$(GREMLIN_VERSION) -t $(VERSION_TAG_NAME) -t $(LATEST_TAG_NAME) .

push-docker-graph-notebook-gremlin-server:
	$(eval REPO_NAME=samjackmartin/docker-graph-notebook-gremlin-server)
	$(eval VERSION_TAG_NAME=$(REPO_NAME):$(GREMLIN_VERSION))
	$(eval LATEST_TAG_NAME=$(REPO_NAME):latest)
	docker push $(VERSION_TAG_NAME)
	docker push $(LATEST_TAG_NAME)


build-and-push-docker: build-docker-graph-notebook build-docker-graph-notebook-gremlin-server push-docker-graph-notebook push-docker-graph-notebook-gremlin-server
