FROM python:3.6.12
ARG GRAPH_NOTEBOOK_VERSION=3.0.6
RUN useradd -ms /bin/sh notebook

RUN pip install notebook==5.7.13 tornado==4.5.3 rdflib==5.0.0

# nodejs Only required when building graph-notebook from source
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs
RUN pip install git+https://github.com/sam-martin/graph-notebook.git@feature/opencypher-path
RUN mkdir -p /usr/local/lib/python3.6/site-packages/graph_notebook/widgets/nbextension/static

RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets
RUN python -m graph_notebook.static_resources.install
RUN python -m graph_notebook.nbextensions.install

COPY react-dom.production.min.js /usr/local/lib/python3.6/site-packages/notebook/static/components/react
EXPOSE 8888/tcp
USER notebook

WORKDIR /notebook/
CMD jupyter notebook --port=8888 --ip 0.0.0.0 --no-browser --NotebookApp.custom_display_url=http://localhost:8888
