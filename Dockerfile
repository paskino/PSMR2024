# syntax=docker/dockerfile:1
ARG BASE_CONTAINER=synerbi/sirf:latest-gpu
FROM ${BASE_CONTAINER} as base

RUN pip install --no-cache-dir torch torchvision torchaudio
RUN mv /home/${NB_USER}/.bashrc /usr/local/bin/start-notebook.d/sirf_bashrc.sh
