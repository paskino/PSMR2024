# syntax=docker/dockerfile:1
ARG BASE_CONTAINER=synerbi/sirf:devel-gpu
FROM ${BASE_CONTAINER} as base

RUN pip install --no-cache-dir torch torchvision

USER root

# fix build dir permissions
RUN chown -R ${NB_USER} /opt/SIRF-SuperBuild

## fix entrypoints
## https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#startup-hooks
#RUN cp /opt/SIRF-SuperBuild/INSTALL/bin/env_sirf.sh /usr/local/bin/start-notebook.d/

USER ${NB_USER}
