FROM python:3.6.12
ARG GRAPH_NOTEBOOK_VERSION=3.0.6
RUN useradd -ms /bin/sh notebook

RUN pip install rdflib==5.0.0 graph-notebook==${GRAPH_NOTEBOOK_VERSION}

RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets
RUN python -m graph_notebook.static_resources.install
RUN python -m graph_notebook.nbextensions.install
RUN python -m graph_notebook.configuration.generate_config \
    --host "gremlin" \
    --port "8182" \
    --ssl "false" \
    --config_destination /home/notebook/graph_notebook_config.json

COPY react-dom.production.min.js /usr/local/lib/python3.6/site-packages/notebook/static/components/react
EXPOSE 8888/tcp
USER notebook

WORKDIR /notebook/
CMD jupyter notebook --port=8888 --ip 0.0.0.0 --no-browser --NotebookApp.custom_display_url=http://localhost:8888
