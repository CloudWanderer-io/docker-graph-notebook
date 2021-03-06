# docker-graph-notebook

This repo is intended to facilitate the setup of an AWS Neptune like environment on a local machine.

## Usage

```
docker compose up
```

Look in the output for something that looks like
```
jupyter-notebook_1  |     To access the notebook, open this file in a browser:
jupyter-notebook_1  |         file:///root/.local/share/jupyter/runtime/nbserver-7-open.html
jupyter-notebook_1  |     Or copy and paste one of these URLs:
jupyter-notebook_1  |         http://localhost:8888/?token=88dc054886e3ea73480de91066937a33c9bc8bd484eb395c
```

And open the http://localhost:8888/?token=... address in your browser.

Navigate to `GettingStarted.ipynb` to get started.

## Troubleshooting

If you're trying to use the ``docker-graph-notebook`` image with a gremlin server outside the configuration specified in the docker compose
you will probably have to run a `%%graph_notebook_config` cell. 
See [Connecting graph-notebook to a Gremlin Server](https://github.com/aws/graph-notebook/tree/main/additional-databases/gremlin-server) for more information.
