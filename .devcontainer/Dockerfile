FROM continuumio/miniconda3:latest
# RUN apt update -y

# Create a user with a given User and Group ID
# https://vsupalov.com/docker-shared-permissions/
ARG UID
ARG GID
RUN addgroup --gid $GID user
RUN adduser --disabled-password --gecos '' --uid $UID --gid $GID user

USER user
COPY conda-env-*.yml /

ENV PYTHONDONTWRITEBYTECODE=true

# Create hf-autotrain env and torchgeo env
RUN conda env create -f conda-env-hf-autotrain.yml \
 && conda env create -f conda-env-torchgeo.yml \
 && conda env create -f conda-env-raster-vision.yml

# Make RUN commands use bash not sh -necessary to make conda work
SHELL ["/bin/bash", "--login", "-c"]

# Initialize conda in bash config files (~/.bashrc) for all future RUNs
RUN conda init bash

# Install hf-autotrain kernel
# also https://huggingface.co/docs/autotrain/en/quickstart
RUN conda activate hf-autotrain \
 && python -m nltk.downloader punkt \
 && pip install flash-attn --no-build-isolation \
 && pip install deepspeed \
 && python -m ipykernel install --user --name=hf-autotrain

 # Install torchgeo kernel, which terratorch also uses
RUN conda activate torchgeo \
 && python -m ipykernel install --user --name=torchgeo 

 # Install raster-vision kernel
 RUN conda activate raster-vision \
 && python -m ipykernel install --user --name=raster-vision 

# Install notebook outside of environments
# Run in base conda env so it knows about pip
RUN conda run pip install notebook python-dotenv mlflow
