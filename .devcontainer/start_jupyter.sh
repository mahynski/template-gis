#!/bin/bash
export MLFLOW_TRACKING_URI="http://127.0.0.1:4342";
jupyter notebook --port 4142 --ip='*' --NotebookApp.token='' --NotebookApp.password=''; # Start a Jupyter Notebook server with no password so we can easily access it from base env
