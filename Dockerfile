FROM jupyter/r-notebook

RUN conda install --quiet --yes \
    'r-rstan' 

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password=''