# syntax=docker/dockerfile:1
ARG BASE_CONTAINER=synerbi/sirf:latest-gpu
FROM ${BASE_CONTAINER} as base

RUN pip install --no-cache-dir torch torchvision torchaudio

# fix entrypoints
USER root
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#startup-hooks
RUN cp /opt/SIRF-SuperBuild/INSTALL/bin/env_sirf.sh /usr/local/bin/start-notebook.d/
USER ${NB_USER}
COPY --link --chmod=644 ./start-gadgetron-notebook.sh /opt/scripts/
ENTRYPOINT ["tini", "-g", "--", "/opt/scripts/start-gadgetron-notebook.sh"]
CMD []
