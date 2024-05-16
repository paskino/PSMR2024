# syntax=docker/dockerfile:1
ARG BASE_CONTAINER=synerbi/sirf:latest-gpu
FROM ${BASE_CONTAINER} as base

RUN pip install --no-cache-dir torch torchvision torchaudio

USER jovyan
COPY entrypoint.sh  /opt/conda/bin/entrypoint.sh
ENTRYPOINT ["/opt/conda/bin/entrypoint.sh"]