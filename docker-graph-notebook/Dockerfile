FROM python:3.6
RUN pip install notebook==5.7.13 tornado==4.5.3 rdflib==5.0.0 graph-notebook
RUN jupyter nbextension install --py --sys-prefix graph_notebook.widgets
RUN jupyter nbextension enable  --py --sys-prefix graph_notebook.widgets
RUN python -m graph_notebook.static_resources.install
RUN python -m graph_notebook.nbextensions.install
EXPOSE 8888/tcp
CMD jupyter notebook --port=8888 --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.custom_display_url=http://localhost:8888
