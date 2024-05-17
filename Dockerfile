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
COPY --link --chmod=644 ./jupyterhub_config.py  /opt/scripts/
ENTRYPOINT ["tini", "-g", "--", "/opt/scripts/start-gadgetron-notebook.sh"]
CMD ["start-notebook.py", "--PasswordIdentityProvider.hashed_password='sha1:cbf03843d2bb:8729d2fbec60cacf6485758752789cd9989e756c'"]
