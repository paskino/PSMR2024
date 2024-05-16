# syntax=docker/dockerfile:1
ARG BASE_CONTAINER=synerbi/sirf:latest-gpu
FROM ${BASE_CONTAINER} as base

RUN pip install --no-cache-dir torch torchvision torchaudio
RUN echo 'source /opt/SIRF-SuperBuild/INSTALL/bin/env_sirf.sh' >> /usr/local/bin/start-notebook.d/env_sirf.sh
