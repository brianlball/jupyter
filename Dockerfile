FROM jupyter/datascience-notebook

USER root
RUN ln -s /bin/tar /bin/gtar
     
USER $NB_UID     
RUN conda install --quiet --yes \
    'r-rstan' \
    'r-plotly' \
    'r-devtools' \
    && R -e "devtools::install_github('timelyportfolio/parcoords')"

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.iopub_data_rate_limit=1.0e10